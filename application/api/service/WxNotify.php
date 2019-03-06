<?php
/**
 * Created by PhpStorm.
 * User: xiaolu
 * Date: 2018/7/1
 * Time: 8:59
 */

namespace app\api\service;

use app\lib\enum\OrderStatusEnum;
use think\Db;
use think\Exception;
use think\Loader;
use app\api\model\Order as OrderModel;
use app\api\service\Order as OrderService;
use think\Log;

Loader::import('WxPay.WxPay',EXTEND_PATH,'.Api.php');
class WxNotify extends \WxPayNotify
{
    //成功返回的data格式
    // <xml>
    //  <appid><![CDATA[wx2421b1c4370ec43b]]></appid>
    // <attach><![CDATA[支付测试]]></attach>
    // <bank_type><![CDATA[CFT]]></bank_type>
    //<fee_type><![CDATA[CNY]]></fee_type>
    //<is_subscribe><![CDATA[Y]]></is_subscribe>
    //<mch_id><![CDATA[10000100]]></mch_id>
    // <nonce_str><![CDATA[5d2b6c2a8db53831f7eda20af46e531c]]></nonce_str>
    //<openid><![CDATA[oUpF8uMEb4qRXf22hE3X68TekukE]]></openid>
    // <out_trade_no><![CDATA[1409811653]]></out_trade_no>
    //<result_code><![CDATA[SUCCESS]]></result_code>
    //<return_code><![CDATA[SUCCESS]]></return_code>
    //<sign><![CDATA[B552ED6B279343CB493C5DD0D78AB241]]></sign>
    //<sub_mch_id><![CDATA[10000100]]></sub_mch_id>
    //<time_end><![CDATA[20140903131540]]></time_end>
    // <total_fee>1</total_fee>
    //<coupon_fee><![CDATA[10]]></coupon_fee>
    //  <coupon_count><![CDATA[1]]></coupon_count>
    // <coupon_type><![CDATA[CASH]]></coupon_type>
    // <coupon_id><![CDATA[10000]]></coupon_id>
    // <coupon_fee><![CDATA[100]]></coupon_fee>
    //<trade_type><![CDATA[JSAPI]]></trade_type>
    //<transaction_id><![CDATA[1004400740201409030005092168]]></transaction_id>
    // </xml>


    /**
     * 重写回调方法
     * @param array $data
     * @param string $msg
     * @throws
     * @return null|true
     */
    public function NotifyProcess($data, &$msg)
    {
        /**
         * 1.检查库存，防止超卖
         * 2.更新订单状态status
         * 3.减库存
         * 4.如果成功处理，返回给微信成功处理的信息，否则返回失败
         * (特点：post，xml）
         */
        //业务结果为success
        if($data['result_code'] == 'SUCCESS')
        {
            //检查库存
            //获取订单号
            $out_trade_no = $data['out_trade_no'];
            //在这里启用事务，防止微信并发
            Db::startTrans();
            try{

                //根据订单号获取订单id
                $orderData = OrderModel::where('order_no' ,'=',$out_trade_no)->fetch();
                //检查库存量
                $check = new OrderService();
                $stockStatus = $check->checkOrderStock($orderData['id']);
                if($stockStatus['pass'])
                {
                    //更新订单的状态
                    $this->updateOrderStatus($orderData['id'],OrderStatusEnum::PAID);
                    //减库存
                    $this->reduceStock($stockStatus['pStatusArray']);
                }else{
                    //支付成功但是库存不足，超卖现象
                    //更新订单的状态为已支付但是库存不足
                    $this->updateOrderStatus($orderData['id'],OrderStatusEnum::PAID_BUT_OUT_OF);
                }
                Db::commit();
                //返回true则微信终止检测回调
              return true;

            }catch (Exception $e)
            {
                //记录日志
                Log::record($e);
                Db::rollback();
                return false;

            }


        }else{
            return true;
        }
        //需要正确返回的xml格式
        // <xml>
        //<return_code><![CDATA[SUCCESS]]></return_code>
        //<return_msg><![CDATA[OK]]></return_msg>
        //</xml>
    }
    private function updateOrderStatus($order_id,$status)
    {
        //订单状态更改
       OrderModel::where('id','=',$order_id)->update(['status' =>$status]);
    }


    /**
     * 减库存量
     * @param array $pStatusArray
     * @throws Exception
     */
    private function reduceStock($pStatusArray = [])
    {
        /**
         * 单个产品状态结构
         * $pStatus =[
            'id' => null , //产品的id
            'haveStock' =>false,
            'count' =>0 , //所购的数量
            'name' =>'',  //产品的名称
            'totalPrice' =>0 //该产品的总价格
        ];
         **/
       foreach ($pStatusArray as $singleStatus)
       {
           OrderModel::where('id','=',$singleStatus['id'])->
           setDec('stock',$singleStatus['count']);

       }


    }

}