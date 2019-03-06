<?php
/**
 * Created by PhpStorm.
 * User: xiaolu
 * Date: 2018/6/20
 * Time: 22:51
 */

namespace app\api\controller\v1;


use app\api\controller\BaseController;
use app\api\model\OrderProduct;
use app\api\validate\IDMustBePostiveInt;
use app\api\validate\OrderPlace;
use app\api\service\Token as TokenService;
use app\api\service\Order as OrderService;
use app\api\validate\PagingParameter;
use app\api\model\Order as OrderModel;
use app\lib\exception\OrderException;

class Order extends BaseController
{
    //使用前置方法检查权限
    protected $beforeActionList=[
        'checkExclusiveScope'=> ['only'=>'placeOrder'],
        'checkPrimaryScope'=>['only'=>'getSummaryByUser']
    ];
    //下单接口流程
    /**
     * 1.用户在选择商品后，向api提交包含它所选商品的相关信息
     * 2.API在接收到信息后，需要检查所选商品的库存量
     * 3.有库存，把订单数据存入数据库中，下单成功了，返回客户端消息，告诉客户端可以支付了
     * 4.调用我们的支付接口，进行支付
     * 5.还需要在此进行库存量检测
     * 6.服务器这边就可以调用微信的支付接口进行支付
     * 7.微信服务器返回支付结果给小程序
     * 8.微信也会返回给我们支付的结果
     * 9.成功：也需要进行库存量的检查
     * 10.失败：记性库存量的扣除，返回一个失败的结果
     */


    /**
     * 下单接口
     * @throws \think\Exception
     */
    public function placeOrder()
    {
        (new OrderPlace())->goCheck();
        $products = input('post.products/a');
        $uid = TokenService::getCurrentUid();
        //实例化并且调用下单方法
        $order = new OrderService();
        $result = $order ->place($uid,$products);
        return $result;

    }

    /**
     * 获取用户的历史订单接口
     * @param int $page
     * @param int $size
     * @throws
     */
    public function getSummaryByUser($page =1,$size =15)
    {
        //检查参数
        (new PagingParameter())->goCheck();
        //获取UID，分页查询
        $uid = TokenService::getCurrentUid();
         $pageData = OrderModel::getSummaryByUser($uid,$page,$size);
         //这里返回的是pagenate 对象
        if($pageData->isEmpty())
        {
             $temp =[
                'data'=>'',
                'current_page'=>$pageData->currentPage()
            ];
             return json($temp);
        }else{
            $data = $pageData->hidden(['snap_items','snap_address','prepay_id'])->toArray();
            $temp = [
                'data'=>$data,
                'current_page'=>$pageData->currentPage()
            ];
            return json($temp);
        }


    }

    /**
     * 获取指定id的订单详情
     * @param $id
     * @return OrderModel
     * @throws OrderException
     * @throws \think\Exception
     * @throws \think\exception\DbException
     */
    public function getDetail($id)
    {
        (new IDMustBePostiveInt())->goCheck();
        $detail = OrderModel::get($id);
        if(!$detail){
            throw new OrderException();
        }else{
            return json($detail->hidden(['prepay_id']));
        }


    }

}