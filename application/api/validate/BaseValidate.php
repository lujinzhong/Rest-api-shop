<?php
/**
 * Created by PhpStorm.
 * User: xiaolu
 * Date: 2018/6/12
 * Time: 20:15
 */

namespace app\api\validate;

use app\lib\exception\ParameterException;
use think\Exception;
use think\Validate;

/**
 * Class BaseValidate
 * @package app\api\validate
 * 所有验证器的基类
 */
class BaseValidate extends Validate
{
    /**
     * 自定义request请求参数验证
     * @return bool
     * @throws Exception
     */
    public function goCheck(){
        //获取http参数
        //对参数进行校验
        $data = request()->param();
        //这里要使用批量验证，不然多个参数无效
        $result = $this->batch()->check($data);
        if(!$result){
            //验证失败抛出自定义参数异常,这里传入数组来重写变量
            $e = new ParameterException([
               'msg'=>$this->error,

            ]);

            throw $e;
//            throw new Exception($error);

        }else{
            return true;
        }

    }
    /**
     * @param $value
     * @param string $rule 规则
     * @param string $data 验证数据
     * @param string $field
     */
    protected  function isPositiveInteger($value,$rule = '', $data = '', $field ='')
    {

        /**
         * 判断id是否为正整数
         */
        if(is_numeric($value) && is_int($value +0) && (($value +0)>0)){
            return true;
        }else{
            //这里不能返回字符串，不然theme控制器验证那里永远是true
           //    return $field.'必须为正整数';
            return false;
        }

    }


    /**
     * @param $value
     * @param string $rule
     * @param string $data
     * @param string $field
     * @return bool
     * 参数不为空
     */
    protected function isNotEmpty($value,$rule = '', $data = '', $field ='')
    {
        if(empty($value))
        {
            return false;
        }else{
            return true;
        }

    }

    /**
     * 11位手机号验证
     * @param $value
     * @param string $rule
     * @param string $data
     * @param string $field
     * @return bool
     */
    public function isMobile($value,$rule = '',$data = '',$field = '')
    {
        //手机号正则
        $rule = "/^1[34578]\d{9}$/";
        $result = preg_match($rule,$value);
        if($result)
        {
            return true;
        }else{
            return false;
        }
    }

    /**
     * @param $arrays
     * @return array
     * @throws ParameterException
     */
    public function getValueByRule($arrays)
    {
        if(array_key_exists('user_id',$arrays)|
            array_key_exists('uid',$arrays))
        {
            throw new ParameterException([
                    'msg' =>'尝试传入非法的uid或者user_id'
                ]);
        }
        //指获取规则中所拥有的字段
        $new_array = [];
        foreach ($this->rule as $key =>$value)
        {
            $new_array[$key] = $arrays[$key];
        }
        return $new_array;

    }



}