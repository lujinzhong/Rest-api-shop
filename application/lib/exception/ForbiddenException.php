<?php
/**
 * Created by PhpStorm.
 * User: xiaolu
 * Date: 2018/6/20
 * Time: 21:47
 */

namespace app\lib\exception;


class ForbiddenException extends BaseException
{
    public $code ='403';
    public $msg = '权限不足';
    public $errorCode ='';

}