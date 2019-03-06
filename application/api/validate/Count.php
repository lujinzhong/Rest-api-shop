<?php
/**
 * Created by PhpStorm.
 * User: xiaolu
 * Date: 2018/6/15
 * Time: 20:46
 */

namespace app\api\validate;


class Count extends BaseValidate
{
    protected $rule =[
      'count' =>'isPositiveInteger|between:1,15'

    ];

}