<?php
/**
 * Created by PhpStorm.
 * User: xiaolu
 * Date: 2018/6/18
 * Time: 20:36
 */

namespace app\api\model;


class ProductImage extends BaseModel
{
    //要隐藏的属性
    protected $hidden = [
        'delete_time','img_id','product_id'
    ];

    /**
     * 根据img_id来连接image表获取图片链接地址
     */
    public function imgUrl()
    {
       //一对一关系
       return  $this->belongsTo('Image','img_id','id');

    }

}