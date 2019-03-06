<?php
/**
 * Created by PhpStorm.
 * User: xiaolu
 * Date: 2018/6/17
 * Time: 13:06
 */

namespace app\api\service;


use app\lib\enum\ScopeEnum;
use app\lib\exception\TokenException;
use app\lib\exception\WechatException;
use think\Exception;
use  app\api\model\User as UserModel;
class UserToken extends Token
{
    protected $code;
    protected $wxAppID;
    protected $wxAppSecret;
    protected $wxLoginUrl;

    public function __construct($code)
    {
        //初始化数据
        $this->code = $code;
        $this->wxAppID = config('wx.app_id');
        $this->wxAppSecret = config('wx.app_secret');
        //格式化url
        $this->wxLoginUrl = sprintf(config('wx.login_url'),$this->wxAppID,$this->wxAppSecret,$this->code);
    }

    /**
     * @throws Exception
     */
    public function get()
    {
        //请求微信接口,该封装函数返回数组
        $result = json_decode(curl_get($this->wxLoginUrl),true);
        if(empty($result))
        {
            throw new Exception('获取sessionkey和openId错误，请检查');
        }else{
            //如果出错会有errorCode字段
            $login_sign = array_key_exists('errorcode',$result);
            if($login_sign) {
                //失败
                $this->processLoginException($result);
            }else{
                //成功
               return $this->grantToken($result);
            }

        }

    }

    /**
     * @param $cacheValue
     * @throws
     * 写入缓存 key-value    id-$cacheValue
     */
    protected function saveToCache($cacheValue)
    {
        //key 为三个字符串md5加密的
         $key = self::generateToken();
         $value =json_encode($cacheValue);
          //获取过期时间
        $expire_in = config('setting.expire_token_time');
        //把key-value写入tp5自带缓存中(可以通过更改配置文件来使用redis或MongoDB
        $request = cache($key,$value,$expire_in);
        if(!$request){
            throw new TokenException([
                'msg' =>'服务器缓存异常',
                'errCode'=>'1005'
            ]);
        }

     //返回令牌token
        return $key;
    }
    /**
     * @param $result
     * @param $uid
     * @return mixed
     * 缓存前数据封装
     */
    private function prepareCacheValue($result,$uid)
    {
        //要缓存的数据数组
        $cacheValue = $result;
        $cacheValue['uid'] =$uid;
        //app 端
        $cacheValue['scope'] =ScopeEnum::User;
        return $cacheValue;


    }

    /**
     * @param $result
     * @throws
     * 授权token，更新user表
     */
    private function  grantToken($result)
   {
       //1.拿到openID
       $openID = $result["openid"];
       //2.查看数据库是否有这个openID记录
        $user =UserModel::getByOpenID($openID);
        if(isset($user->id)){
             $uid = $user->id;
        }else{
            //3.不存在则增加一条user记录,并返回这条的id
               $uid = $this->newUser($openID);
        }

       //4.生成令牌，写入缓存数据
         $cacheValue = $this->prepareCacheValue($result,$uid);
         $token =$this->saveToCache($cacheValue);
        //5.返回令牌给客户端
       return $token;
    }

    /**
     * @param $openID
     * @return mixed
     * 新增user
     */
    private function newUser($openID)
    {
        //新增
       $user = UserModel::create([
            'openid'=>$openID
        ]);
       //返回新增的这条id
        return $user->id;

    }


    /**
     * @param $result
     * @throws WeChatException
     * 获取openID错误
     */
    private function processLoginException($result)
    {
        //抛出异常
      throw new WechatException([
          'msg'=>$result["errmsg"],
          'errCode'=>$result['errcode']
      ]);


    }

}