<?php
/**
 * Created by PhpStorm.
 * User: xiaolu
 * Date: 2018/6/17
 * Time: 14:23
 */

namespace app\lib\exception;


class WechatException extends BaseException
{
    public $code ='404' ;
    public $msg = '微信openID获取异常';
    public $errorCode ='50000' ;

}