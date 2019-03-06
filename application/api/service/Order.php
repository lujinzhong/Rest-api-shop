<?php
/**
 * Created by PhpStorm.
 * User: xiaolu
 * Date: 2018/6/22
 * Time: 8:40
 */

namespace app\api\service;


use app\api\model\OrderProduct;
use app\api\model\Product;
use app\api\model\UserAddress;
use app\lib\exception\OrderException;
use app\lib\exception\UserException;
use think\Exception;
use think\Db;

class Order
{
    //用户订单的产品
    protected $oProducts;
    //数据库的真实产品
    protected $products;
     //用户id
    protected $uid;
    //用户下订单的orderID
    protected $order_id;

    /**
     * 下单
     * @param $uid
     * @param $oProducts
     * @return array
     * @throws
     */
    public function place($uid,$oProducts)
    {
        $this->uid = $uid;
        $this->oProducts = $oProducts;
        //根据订单的产品id获取真实数据库的产品信息
        $this->products =$this->getProductsByProductId($oProducts);
        //进行库存量检测
        $status = $this->getOrderStatus();
        //订单状态不通过
        if(!$status['pass']){
            $status['order_id'] = -1;
            return json($status);
        }
        //创建订单快照
        $orderSnap = $this->snapOrder($status);

        //创建订单写入数据库
         $result = $this->createOrder($orderSnap);
         $status['order_id'] = $this->order_id;
         return json($status);


    }

    /**
     * 创建订单快照
     * @param $status
     * @return \think\response\Json
     * @throws
     */
    private function createOrder($orderSnap)
    {
        // 启动事务
        Db::startTrans();
        try {
            //获取订单号
            $orderNo = self::makeOrderNo();
            $order = new \app\api\model\Order();
            //初始化数据
            $order->user_id = $orderSnap['id'];
            $order->order_no = $orderNo;
            $order->total_price = $orderSnap['orderPrice'];
            $order->snap_img = $orderSnap['snapImg'];
            $order->snap_name = $orderSnap['snapName'];
            $order->total_count = $orderSnap['totalCount'];
            $order->snap_address = $orderSnap['snapAddress'];
            $order->snap_items = json_encode($orderSnap['pStatus']);
            //保存
            $order->save();
            //获取订单的id
            $orderId = $order->id;
            //获取订单下单时间
            $create_time = $order->create_time;
            //为每个商品的添加一个order_id字段，就是order表的id
            foreach ($this->oProducts as &$p)  //这里用传引用，不然无法修改
            {
                $p['order_id'] = $orderId;
            }

            //保存到order_product表
            $order_product = new OrderProduct();
            $order_product->saveAll($this->oProducts);
            // 提交事务
            Db::commit();
            $data = [
                'create_time' => $create_time,
                'order_id' => $orderId,
                'order_no' => $orderNo
            ];
            $this->order_id = $orderId;
            return json($data);

        }catch (Exception $e){
            // 回滚事务
            Db::rollback();
            throw $e;
        }

    }

    /**
     * 生成订单号
     * @return string
     */
    public static function makeOrderNo()
    {
        $yCode = array('A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J');
        $orderSn =
            $yCode[intval(date('Y')) - 2018] . strtoupper(dechex(date('m'))) . date(
                'd') . substr(time(), -5) . substr(microtime(), 2, 5) . sprintf(
                '%02d', rand(0, 99));
        return $orderSn;
    }

    /**
     * @param $status
     * @return array
     * @throws
     * 生成订单快照数据
     */
    private function snapOrder($status)
    {
        //订单快照结构
        $snap = [
            'id' =>'',        //用户的uid
          'orderPrice' =>0,  //订单付款价格
          'totalCount'=>0,   //订单商品总数
            'pStatus'=>[],   //订单状态
            'snapAddress'=>null,  //订单地址
            'snapName'=>'',      //订单名称
            'snapImg'=>'',      //订单缩略图

        ];
        //填充数据
        $snap['id'] = $this->uid;
        $snap['orderPrice'] = $status['orderPrice'];
        $snap['totalCount'] = $status['totalCount'];
        $snap['pStatus'] = $status['pStatusArray'];
        $snap['snapAddress'] = json_encode($this->getAddress());
        $snap['snapName'] = $this->products[0]['name']; //第一个商品的名称
        $snap['snapImg'] = $this->products[0]['main_img_url'];//图片
        //如果商品的种类多于一种，则在名称后加个等
        if(count($this->products)>1)
        {
            $snap['snapName'].='等';
        }

        return $snap;
    }



    /**
     * @return UserAddress
     * @throws \app\lib\exception\TokenException
     * @throws \think\Exception
     * @throws \think\exception\DbException
     * 用于获取用户的地址
     */
    private function getAddress()
    {

        $userAddress = UserAddress::get(['id'=>$this->uid]);
        //如果用户地址不存在
        if(empty($userAddress)){
            throw new UserException([
                'msg' =>'用户收货地址不存在',
                'errorCode'=>'60001',
            ]);
        }

        return $userAddress; //返回的是对象
    }

    /**
     * 订单的状态
     * @throws OrderException
     */
    private function getOrderStatus()
    {
        $status =[
            'pass' => true,       //订单通过标志
            'orderPrice' =>0,    //订单的总价格
            'totalCount'=>0,     //订单的商品总数量
            'pStatusArray'=>[]   //每个订单的状态(多个pStatus的数组）
        ];
        //与数据库的进行比较
        foreach ($this->oProducts as $oProduct)
        {
            //遍历获取单个产品的状态
            $pStatus = self::getProductStatus($oProduct['product_id'],$oProduct['count'],$this->products);
            //库存量检测
            if(!$pStatus['haveStock'])
            {
                $status['pass'] =false;
            }else{
                //叠加每个商品的价格和统计商品总数量
                $status['orderPrice']+=$pStatus['totalPrice'];
                $status['totalCount']+=$pStatus['count'];
                array_push($status['pStatusArray'],$pStatus);
            }

        }
        return $status;

    }


    /**
     * 订购的每个产品的状态，正常返回True
     * @param $oPid
     * @param $oCount
     * @param $products
     * @return array
     * @throws OrderException
     */
    private function  getProductStatus($oPid,$oCount,$products)
    {
        //产品的下标
        $pIndex =-1;
        $pStatus =[
            'id' => null , //产品id
            'haveStock' =>false,
            'count' =>0 ,  //该产品购买数量
            'name' =>'',    //产品名称
            'totalPrice' =>0   //总价格
        ];
        //遍历产品数组，获取指定oPid的产品下标索引
        for ($i=0;$i<count($products);$i++) {
            //$products[0]['id']
            //$products[1]['id']..
            if ($oPid == $products[$i]['id']) {
                $pIndex = $i;
            }
        }
            //如果没有找到该商品
            if($pIndex == -1){
                throw new OrderException([
                    'msg'=>'id为'.$oPid.'的商品不存在，创建订单失败'
                ]);
            }else{
                //检测库存量
                $product =$products[$pIndex];
                $pStatus['id'] =$product['id'];
                $pStatus['count'] =$oCount;
                $pStatus['name'] = $product['name'];
                $pStatus['totalPrice'] =$oCount * $product['price'];
                if($product['stock']-$oCount >=0)
                {
                    //库存量足够
                    $pStatus['haveStock'] = true;
                }
            }



            return $pStatus;
    }
    /**
     * 通过传入多个产品的id批量获取到数据库的真实数据情况
     * @param $oProducts
     * @return mixed
     * @throws \think\exception\DbException
     */
    private function getProductsByProductId($oProducts)
    {
        //通过传递进来的oProducts的id来向数据库查询所有的数据
        $oPid =[];
        foreach ($oProducts as $oProduct) {
            array_push($oPid,$oProduct['product_id']);
        }
        //数据库查询
       $Products = Product::all($oPid)->visible(['id','name','stock','price','main_img_url'])->toArray();
        return $Products;
    }

    /**
     * 提供一个向外的库存量检测方法
     * 主要需要两个参数，$oProducts $Products
     * @param $orderID
     * @throws
     */
    public function checkOrderStock($orderID)
    {
        //先从数据库中获取所选orderID的订单产品信息
        $oProducts = OrderProduct::where('order_id','=',$orderID)->select();
        $this->oProducts = $oProducts;
        //再获取真实数据库的products
        $products = $this->getProductsByProductId($oProducts);
        $this->products = $products;
        //检查订单状态
        $status = $this->getOrderStatus();
        return $status;

    }


}