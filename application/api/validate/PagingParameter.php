<?php
/**
 * Created by PhpStorm.
 * User: xiaolu
 * Date: 2018/7/1
 * Time: 16:40
 */

namespace app\api\validate;


class PagingParameter extends BaseValidate
{
    protected $rule =[
        'page'=>'require|isPositiveInteger',
        'size'=>'require|isPositiveInteger'
        ];

}