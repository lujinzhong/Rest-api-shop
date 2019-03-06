<?php
/**
 * Created by PhpStorm.
 * User: xiaolu
 * Date: 2018/6/19
 * Time: 17:22
 */

namespace app\api\validate;


class AddressNew extends BaseValidate
{
    protected $rule = [
        'name' => 'require|isNotEmpty' ,
        'mobile'=>'require|isMobile',
        'province'=>'require|isNotEmpty',
        'city'    =>'require|isNotEmpty',
        'country' =>'require|isNotEmpty',
        'detail' =>'require|isNotEmpty',
    ];

}