<?php
/**
 * Created by PhpStorm.
 * User: xiaolu
 * Date: 2018/6/18
 * Time: 20:30
 */

namespace app\api\model;


class ProductProperty extends BaseModel
{
    //要隐藏的属性
    protected $hidden = [
        'delete_time','update_time','id'
    ];

}