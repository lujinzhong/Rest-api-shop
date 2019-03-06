<?php
/**
 * Created by PhpStorm.
 * User: xiaolu
 * Date: 2018/6/17
 * Time: 16:01
 */

namespace app\api\service;


use app\lib\enum\ScopeEnum;
use app\lib\exception\ForbiddenException;
use app\lib\exception\TokenException;
use think\Exception;

class Token
{

    public static function generateToken()
    {
        //获取32位随机字符串
        $str = getRandChar(32);
        //三组字符串进行md5加密
        $timeStamp =$_SERVER['REQUEST_TIME_FLOAT'];
        //salt
        $salt = config('secure.token_salt');
        //返回token
        return md5($str.$timeStamp.$salt);

    }



    /**
     * 用于取出缓存中的具体字段信息
     * @param $key
     * @throws
     */
    public static function getCurrentTokenVar($key)
    {
        //获取header头的token
        $token = request()->header('token');
        //获取缓存中的token
        $vars = cache($token);
        if(empty($vars)){
            throw new TokenException();
        }else{
            if(!is_array($vars)){
                $vars = json_decode($vars,true);
            }
            if(!array_key_exists($key,$vars)){
                throw new Exception('传入不符合的token');
            }else{
                return $vars[$key];
            }

        }

    }




    /**
     * 根据token获取用户的UID
     * @return mixed
     * @throws Exception
     * @throws TokenException
     */
    public static function getCurrentUid()
    {
        $uid = self::getCurrentTokenVar('uid');
        return $uid;

    }


    /**
     * 检查权限(管理员和用户都能访问）
     * @throws ForbiddenException
     * @throws TokenException
     * @throws \think\Exception
     */
    public static function needPrimaryScope()
    {
        //先获取缓存中的scope
        $scope = self::getCurrentTokenVar('scope');
        //是否为空
        if($scope){
            //判断是否符合权限
            if($scope >=ScopeEnum::User)
            {
                return true;
            }else{
                throw new ForbiddenException();

            }

        }else{
            throw new TokenException();
        }


    }





    /**
     * 检查权限(只有用户才能访问)
     * @throws ForbiddenException
     * @throws TokenException
     * @throws \think\Exception
     */
    public static  function needExclusiveScope()
    {
        //先获取缓存中的scope
        $scope = self::getCurrentTokenVar('scope');
        //是否为空
        if($scope){
            //判断是否符合权限
            if($scope == ScopeEnum::User)
            {
                return true;
            }else{
                throw new ForbiddenException();

            }

        }else{
            throw new TokenException();
        }


    }


    /**
     * 根据传入的UID用来判断是否是缓存中的UID，以识别是不是当前用户
     * @param $checkedUID
     * @return bool
     * @throws Exception
     * @throws TokenException
     */
    public static function isValidOperate($checkedUID)
    {
        if(!$checkedUID)
        {
            throw new Exception(['msg'=>'必须传入被检测的UID']);

        }
        $currentUID = self::getCurrentUid();
        if($checkedUID == $currentUID)
        {
            return true;
        }else{
            return false;
        }



    }








}