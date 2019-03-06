<?php
/**
 * Created by PhpStorm.
 * User: xiaolu
 * Date: 2018/6/17
 * Time: 12:48
 */

namespace app\api\validate;


class TokenGet extends BaseValidate
{

    protected $rule =[
      'code' => 'require|isNotEmpty'
    ];

    protected $message =[
      'code' =>'没有code你想干嘛'
    ];


}