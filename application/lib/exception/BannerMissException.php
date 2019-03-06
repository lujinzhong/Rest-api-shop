<?php
/**
 * Created by PhpStorm.
 * User: xiaolu
 * Date: 2018/6/12
 * Time: 21:57
 */

namespace app\lib\exception;


class BannerMissException extends BaseException
{
    public $code = '404';
    public $msg = '请求的banner不存在';
    public $errorCode = '10000';

}