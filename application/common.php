<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006-2016 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: 流年 <liu21st@gmail.com>
// +----------------------------------------------------------------------

// 应用公共文件(注意不要加修饰符)


/**
 * @param string $url get请求地址
 * @param int $httpCode 返回状态码
 * @return mixed
 */
function curl_get($url, &$httpCode = 0)
{
    $ch = curl_init();
    curl_setopt($ch, CURLOPT_URL, $url);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);

    //不做证书校验,部署在linux环境下请改为true
    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
    curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 10);
    $file_contents = curl_exec($ch);
    $httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
    curl_close($ch);
    return $file_contents;
}





//封装一个使用curl的函数
/**
 * @param $url
 * @param string $method
 * @param string $data
 * @return mixed
 */
 function use_curl($url,$method='get',$data='')
{
    //初始化curl
    $ch=curl_init();
    //设置参数
    curl_setopt($ch, CURLOPT_URL, $url);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER,1);
    //如果使用的是post调用接口
    if($method=='post')
    {
        curl_setopt($ch, CURLOPT_POST, 1);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $data);

    }
    //执行
    $res=json_decode(curl_exec($ch),true);
    curl_close($ch);
    return $res;   //这里返回的是数组格式的

}

/**
 * @param $length
 * 生成指定长度的随机无意义字符串
 */
function getRandChar($length)
{
    $str = '';
    $strTemp = 'ABCDEFGHIJKLMNOPQRSTUVWHYZabcdefghijklmnopqrstuvwhyz1234567890';
    $max =strlen($strTemp)-1;
    for ($i =0;$i<$length;$i++)
    {
        $str += $strTemp[rand(0,$max)];
    }
    return $str;

}
