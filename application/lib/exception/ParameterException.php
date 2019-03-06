<?php
/**
 * Created by PhpStorm.
 * User: xiaolu
 * Date: 2018/6/13
 * Time: 9:27
 */

namespace app\lib\exception;

/**
 * Class ParameterException
 * @package app\lib\exception
 * 参数错误异常处理类
 */
class ParameterException extends BaseException
{
    //默认的参数错误模板
    public $code = '400';
    public $msg = '参数错误啦';
    public $errorCode = '10000';

    public function __construct($param = [])
    {
        //判断是否为数组
        if(!is_array($param)){
            return;
        }

        if(array_key_exists('code',$param)){
            $this->code = $param['code'];
        }
        if(array_key_exists('msg',$param)){
            $this->msg = $param['msg'];
        }
        if(array_key_exists('errorCode',$param)){
            $this->errorCode = $param['errorCode'];
        }

    }

}