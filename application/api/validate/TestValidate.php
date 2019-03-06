<?php
/**
 * Created by PhpStorm.
 * User: xiaolu
 * Date: 2018/6/12
 * Time: 18:46
 */

namespace app\api\validate;
use think\Validate;

class TestValidate extends Validate
{
    protected $rule=[
      'name' => 'require|max:10',
        'email'=>'email'

    ];

}