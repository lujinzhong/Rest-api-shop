<?php
/**
 * Created by PhpStorm.
 * User: xiaolu
 * Date: 2018/6/15
 * Time: 22:12
 */

namespace app\api\model;


class Category extends BaseModel
{
    //隐藏的字段
    protected $hidden = [
        'delete_time','update_time','create_time'
    ];
    //关联image表
    public function img()
    {
        //一对一
        return $this->belongsTo('image','topic_img_id','id');
    }


}