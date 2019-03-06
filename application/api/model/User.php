<?php
/**
 * Created by PhpStorm.
 * User: xiaolu
 * Date: 2018/6/17
 * Time: 13:04
 */

namespace app\api\model;


class User extends BaseModel
{

    //通过user表的id关联查询userAddress的信息
    public function address()
    {
        //一对一
        return $this->hasOne('userAddress','user_id','id');
    }


    /**
     * @param $openID
     * @return array|false|\PDOStatement|string|\think\Model
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public static function getByOpenID($openID)
    {
       $user = self::where('openid','=',$openID)->find();
       return $user;

    }


}