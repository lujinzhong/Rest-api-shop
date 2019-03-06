<?php
/**
 * Created by PhpStorm.
 * User: xiaolu
 * Date: 2018/6/29
 * Time: 8:39
 */

namespace app\api\controller\v1;


use app\api\service\WxNotify;
use app\api\validate\IDMustBePostiveInt;
use app\api\service\Pay as PayService;
class Pay
{
    //使用前置方法检查权限
    protected $beforeActionList=[
        'checkExclusiveScope'=> ['only'=>'getPreOrder']
    ];

    /**
     * 获取预订单信息
     * @param string $id
     * @throws
     */
    public function getPreOrder($id = '')
    {
        (new IDMustBePostiveInt())->goCheck();
        $pay = new PayService($id);
        return $pay->pay();

    }

    /**
     * 接收微信回调的接口
     */
    public function receiveNotify()
    {
        //频率是：15/15/30/180/1800/1800/1800/1800/3600(s)
        /**
         * 1.检查库存，防止超卖
         * 2.更新订单状态status
         * 3.减库存
         * 4.如果成功处理，返回给微信成功处理的信息，否则返回失败
         * (特点：post，xml）
         */
        $notify = new WxNotify();
        //调用SDK入口
        $notify->Handle();
    }



}