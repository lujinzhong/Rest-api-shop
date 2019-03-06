<?php
/**
 * Created by PhpStorm.
 * User: xiaolu
 * Date: 2018/6/12
 * Time: 21:07
 */

namespace app\api\model;

/**
 * Class Banner
 * @package app\api\model
 * 获取banner的模型类
 */
class Image extends BaseModel
{
    //需要隐藏的字段
    protected $hidden = ['id','from','update_time','delete_time'];

    /**
     * 这个读取器的类名是固定的 ，其中Url是要读取的字段
     * @param $value
     * @param $data
     * @return string
     */
    public function getUrlAttr($value,$data)
    {
       //调用基类中自定义的拼接url函数
        return $this->prefixImgUrl($value,$data);

    }

}