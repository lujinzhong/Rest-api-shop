<?php
/**
 * Created by PhpStorm.
 * User: xiaolu
 * Date: 2018/6/29
 * Time: 18:14
 */

namespace app\lib\enum;


class OrderStatusEnum
{
    //未支付
    const UNPAID = 1;
    //已支付
    const PAID = 2;
    //已发货
    const DELIVERED = 3;
    //已支付但是库存不足
    const PAID_BUT_OUT_OF = 4;
}