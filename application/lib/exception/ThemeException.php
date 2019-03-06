<?php
/**
 * Created by PhpStorm.
 * User: xiaolu
 * Date: 2018/6/15
 * Time: 15:30
 */

namespace app\lib\exception;


class ThemeException extends BaseException
{
    public $code ='404' ;
    public $msg = '指定id的主题不存在';
    public $errorCode ='30000' ;

}