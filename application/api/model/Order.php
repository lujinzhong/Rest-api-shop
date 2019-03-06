<?php
/**
 * Created by PhpStorm.
 * User: xiaolu
 * Date: 2018/6/22
 * Time: 15:17
 */

namespace app\api\model;


class Order extends BaseModel
{
    protected $hidden =['user_id','update_time','delete_time'];
    //设置自动写入时间戳
    protected $autoWriteTimestamp = true;


    /**
     * SnapItems的读取器
     * @param $value
     * @return mixed|null
     */
    public function getSnapItemsAttr($value)
    {
        if(!$value){
           return null;
        }else{
            return json_decode($value);
        }
    }

    /**
     * SnapAddress的读取器
     * @param $value
     * @return mixed|null
     */
    public function getSnapAddressAttr($value)
    {
        if(!$value){
            return null;
        }else{
            return json_decode($value);
        }
    }

    /**
     * @param $page
     * @param $size
     * @param $uid
     * @return \think\Paginator
     * @throws \think\exception\DbException
     */
    public static function getSummaryByUser($uid,$page,$size)
    {
        //根据uid分页查询数据
        return self::where('user_id','=',$uid)->order('create_time desc')
            ->paginate($size,false,['page'=>$page]);

    }

}