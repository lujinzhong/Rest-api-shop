<?php
/**
 * Created by PhpStorm.
 * User: xiaolu
 * Date: 2018/6/20
 * Time: 19:19
 */

namespace app\api\model;


class UserAddress extends  BaseModel
{
    //要隐藏的属性
    protected $hidden = ['id','delete_time','user_id'];

}