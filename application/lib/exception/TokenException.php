<?php
/**
 * Created by PhpStorm.
 * User: xiaolu
 * Date: 2018/6/17
 * Time: 16:44
 */

namespace app\lib\exception;


class TokenException extends BaseException
{
    public $code ='401' ;
    public $msg = 'Token已过期或无效Token';
    public $errorCode ='10001' ;

}