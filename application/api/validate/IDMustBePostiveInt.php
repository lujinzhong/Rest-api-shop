<?php
/**
 * Created by PhpStorm.
 * User: xiaolu
 * Date: 2018/6/12
 * Time: 19:06
 */

namespace app\api\validate;


class IDMustBePostiveInt extends BaseValidate
{
    protected $rule = [
        'id' =>'require|isPositiveInteger',
        'num'=>'in:1,2,3'
    ];



}