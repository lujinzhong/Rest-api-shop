<?php
/**
 * Created by PhpStorm.
 * User: xiaolu
 * Date: 2018/6/19
 * Time: 21:23
 */

namespace app\lib\exception;


class UserException extends BaseException
{
    //HTTP状态码
    public $code ='400';
    //错误具体消息
    public $msg = '用户不存在';
    //错误状态码
    public $errorCode ='60001';

}