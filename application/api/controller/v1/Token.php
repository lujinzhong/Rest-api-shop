<?php
/**
 * Created by PhpStorm.
 * User: xiaolu
 * Date: 2018/6/17
 * Time: 12:47
 */

namespace app\api\controller\v1;


use app\api\service\UserToken;
use app\api\validate\TokenGet;

class Token
{
    /**
     * @param string $code
     * @return null
     * @throws \think\Exception
     * 根据code获取token
     */
    public function getToken($code ='')
    {
        //验证code合法性
        (new TokenGet())->goCheck();
        $ut = new UserToken($code);
        $token = $ut->get();
        //返回token
        $data =['token'=>$token];
        return json($data);
    }

}