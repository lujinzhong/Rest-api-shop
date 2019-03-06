<?php
/**
 * Created by PhpStorm.
 * User: xiaolu
 * Date: 2018/6/15
 * Time: 21:13
 */

namespace app\lib\exception;


class ProductException extends BaseException
{
    public $code ='404' ;
    public $msg = '指定的商品不存在,请检查参数';
    public $errorCode ='20000' ;

}