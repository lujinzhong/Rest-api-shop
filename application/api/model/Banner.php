<?php
/**
 * Created by PhpStorm.
 * User: xiaolu
 * Date: 2018/6/12
 * Time: 21:07
 */

namespace app\api\model;

use think\Exception;
use think\Model;

/**
 * Class Banner
 * @package app\api\model
 * 获取banner的模型类
 */
class Banner extends BaseModel
{
    //需要隐藏的字段
    protected $hidden=['update_time','delete_time'];

    /**
     * @return \think\model\relation\HasMany
     * 关联BannerItem 获取其信息
     */
    public function items()
    {
        //返回一对多的banner_item信息
        return $this->hasMany('banner_item','banner_id','id');
    }



    /**
     * 用于获取指定id的banner
     * @param $id
     * @throws Exception
     */
    public static function getBannerByID($id)
    {
        //TODO:根据id获取banner
       //三表关联获取
        $banner = self::with(['items','items.img'])->find($id);

        return $banner;
    }

}