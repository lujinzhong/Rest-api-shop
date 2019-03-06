<?php
/**
 * Created by PhpStorm.
 * User: xiaolu
 * Date: 2018/6/20
 * Time: 18:36
 */

namespace app\lib\exception;


class SuccessMessage extends BaseException
{
    public $code = '201';
    public $msg = 'ok';
    public $errorCode = '0';

}