<?php
/**
 * Created by PhpStorm.
 * User: xiaolu
 * Date: 2018/6/14
 * Time: 19:41
 */

namespace app\api\model;




class Theme extends BaseModel
{
    //要隐藏的字段
    protected $hidden =['delete_time','update_time','topic_img_id','head_img_id'];

    /**
     * @return \think\model\relation\BelongsTo
     * 获取topicImg路径
     */
    public function topicImg()
    {
        //一对一关联
       return $this->belongsTo('Image','topic_img_id','id');
    }

    /**
     * @return \think\model\relation\BelongsTo
     * 获取headImg图片
     */
    public function headImg()
    {
        //一对一关联
       return $this->belongsTo('Image','head_img_id','id');

    }

    /**
     * @return \think\model\relation\BelongsToMany
     * 通过中间表theme_product获取
     */
    public function Products()
    {
        //一对多关联
        return $this->belongsToMany('Product','theme_product','product_id','theme_id');
    }

    public static function getThemeWithProducts($id)
    {
        $theme = self::with('Products','topicImg','headImg')->find($id);
        return $theme;
    }

}