<?php
/**
 * Created by PhpStorm.
 * User: xiaolu
 * Date: 2018/6/22
 * Time: 10:02
 */

namespace app\lib\exception;


class OrderException extends BaseException
{
    public $code = '404';
    public $msg = '订单不存在,请检测id';
    public $errorCode = '80000';

}