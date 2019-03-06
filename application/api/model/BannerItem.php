<?php
/**
 * Created by PhpStorm.
 * User: xiaolu
 * Date: 2018/6/12
 * Time: 21:07
 */

namespace app\api\model;

use think\Model;

/**
 * Class Banner
 * @package app\api\model
 * 的模型类
 */
class BannerItem extends BaseModel
{
    //需要隐藏的字段
    protected $hidden = ['id','img_id','banner_id','update_time','delete_time'];
    /**
     * @return \think\model\relation\BelongsTo
     * 关联image获取image中的信息
     */
    public function img()
    {
        return $this->belongsTo('Image','img_id','id');
    }


}