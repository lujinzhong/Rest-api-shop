<?php
/**
 * Created by PhpStorm.
 * User: xiaolu
 * Date: 2018/6/12
 * Time: 21:53
 */

namespace app\lib\exception;


use think\Exception;

class BaseException extends Exception
{
    //HTTP状态码
    public $code ='400';
    //错误具体消息
    public $msg = '基础参数错误';
    //错误状态码
    public $errorCode ='10001';

}