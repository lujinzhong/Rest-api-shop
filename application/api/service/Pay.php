<?php
/**
 * Created by PhpStorm.
 * User: xiaolu
 * Date: 2018/6/29
 * Time: 8:59
 */

namespace app\api\service;


use app\api\model\Order as OrderModel;
use app\lib\enum\OrderStatusEnum;
use app\lib\exception\OrderException;
use app\lib\exception\TokenException;
use think\Exception;
use think\Loader;
use think\Log;

Loader::import('WxPay.WxPay',EXTEND_PATH,'.Api.php');

class Pay
{
    //订单ID
    private $orderID = '';
    //订单号
    private $orderNO ='';

    /**
     * Pay constructor.
     * @param $orderID
     * @throws Exception
     */
    public function __construct($orderID)
    {
        //检测订单ID是否为空
        if(!$orderID){
            throw new Exception('订单号不允许为空');

        }
        $this->orderID = $orderID;

    }


    /**
     * 支付主方法
     * @return string|\think\response\Json
     * @throws Exception
     * @throws TokenException
     * @throws \WxPayException
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function pay()
    {
        //检测异常情况
        $this->checkOrderValid();
        //调用order中提供的对外接口库存量检测方法
        //这里再次进行库存量检测的原因是客户下订单后可能不会立马付款，而
        //如果长时间不付款，库存量可能会有改变，因此需要在支付前需要再次进行库存
        //量检测
        $order = new Order();
        $status = $order->checkOrderStock($this->orderID);
        //订单状态不通过
        if(!$status['pass']){
            return json($status);
        }

      return   $this->makeWxPreOrder($status['orderPrice']);


    }

    /**
     * 微信预订单
     * @throws
     * @throws Exception
     * @throws TokenException
     *  @throws \WxPayException
     */

    private function makeWxPreOrder($totalPrice)
    {
        //获取openid
        $openid = Token::getCurrentTokenVar('openid');
        if(!$openid){
            throw new TokenException();
        }
        //调用微信支付统一下单接口
        $wxOrderData = new \WxPayUnifiedOrder();
        //设置相关参数
        $wxOrderData->SetOut_trade_no($this->orderNO);
        $wxOrderData->SetTrade_type('JSAPI');
        $wxOrderData->SetTotal_fee($totalPrice * 100); //这里的价格单位是分
        $wxOrderData->SetBody('Mc零食小店');
        $wxOrderData->SetOpenid($openid);
        $wxOrderData->SetNotify_url(config('secure.pay_back_url'));//支付回调

        return $this->getPaySignature($wxOrderData);
    }

    /**
     * @param $wxOrderData
     * @throws \WxPayException
     */
    private function getPaySignature($wxOrderData)
    {
        //调用统一下单接口
         $wxOrder = \WxPayApi::unifiedOrder($wxOrderData);
        //判断返回值
        if($wxOrder['return_code'] != 'SUCCESS'||$wxOrder['result_code']!='SUCCESS')
        {
            //将错误写入日志中
            Log::record($wxOrder,'error');
            Log::record('获取预支付订单失败','error');
        }
        $this->recordPreOrder($wxOrder);
       $result =  $this->sign($wxOrder);
        return json($result);

    }

    /**
     * 使用SDK生成签名
     * @param $wxOrder
     * @return array
     */
     private function sign($wxOrder)
    {
     //  提交JSAPI输入对象
        $jsApiPayData = new \WxPayJsApiPay();
        //设置appid
        $jsApiPayData->SetAppid(config('wx.app_id'));
        //timeStamp
        $jsApiPayData->SetTimeStamp((string)time());
        //随机串
        $randStr = md5(time().mt_rand(0,1000));
        $jsApiPayData->SetNonceStr($randStr);
        //数据报
        $jsApiPayData->SetPackage('prepay_id='.$wxOrder['prepay_id']);
        //类型
        $jsApiPayData->SetSignType('MD5');
        //生成签名
        $sign  = $jsApiPayData->MakeSign();
        //获得签名数组
        $signData = $jsApiPayData->GetValues();
        //增加字段paySign
        $signData['paySign']=$sign;
        //删除signData中的app_Id字段
        unset($signData['appId']);
        return $signData;


    }
    /**
     * 更新order表的prepay_id属性
     * @param $wxOrder
     */
    private function recordPreOrder($wxOrder)
    {
       OrderModel::where('id','=',$this->orderID)->update(['prepay_id'=>$wxOrder['prepay_id']]);
    }





    /**
     * @throws Exception
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    private function checkOrderValid()
    {
        /** 1.订单号不存在
         * 2.订单号存在但是与当前用户不匹配
         *3.当前订单号状态为已支付
         */
        $order = OrderModel::where('id','=',$this->orderID)->find();
        if(!$order){
            throw new OrderException();
        }
        if(!Token::isValidOperate($order->user_id))
        {
            throw new TokenException([
                'msg'=>'订单与用户不匹配',
                'errorCode'=>1003

            ]);
        }

        //判断订单是否支付
        if($order->status != OrderStatusEnum::UNPAID)
        {
            throw new OrderException([
               'msg' => '该订单已经支付过了',
               'errorCode'=>80003,
                'code' =>400

            ]);
        }
        $this->orderNO =  $order->order_no;
        return true;



    }


}