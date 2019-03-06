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
 * 获取banner的模型类
 */
class BaseModel extends Model
{


    /**
     * 这个读取器的类名是固定的 ，其中Url是要读取的字段
     * @param $value
     * @param $data
     * @return string
     */
    protected function prefixImgUrl($value,$data)
    {
        //from字段为1表示为本地图片，则拼接url
        if($data['from'] == 1) {
            $value = config('setting.img_prefix') . $value;
            return $value;
        }else{
            return $value;
        }

    }

}