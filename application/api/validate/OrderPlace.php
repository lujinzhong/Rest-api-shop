<?php
/**
 * Created by PhpStorm.
 * User: xiaolu
 * Date: 2018/6/21
 * Time: 20:21
 */

namespace app\api\validate;


use app\lib\exception\ParameterException;
use think\Exception;

class OrderPlace extends BaseValidate
{
    /**
     * @var array
     * 多产品验证
     */
    protected $rule =[
      'products'=>'checkProducts',
    ];
    /**
     * @var array
     * 单产品验证
     */
    protected  $singRule =[
        'product_id' => 'require|isPositiveInteger',
        'count'=>'require|isPositiveInteger'
    ];

    /**
     * 验证多个商品参数
     * @param $values
     * @throws Exception
     * @throws ParameterException
     */
    protected function checkProducts($values)
    {
        //验证是否为空
        if(empty($values)){
            throw new ParameterException(['msg'=>'商品列表不能为空']);
        }
        if(!is_array($values)){
            throw new ParameterException(['msg'=>'商品参数有误']);
        }
        foreach ($values as $value)
        {
            $this->checkProduct($value);
        }

        return true;
    }

    /**
     * 验证单个商品参数
     * @param $value
     * @throws Exception
     */
    protected function checkProduct($value)
    {
        $validate = new BaseValidate($this->singRule);
        $result = $validate ->check($value);
        if(!$result){
            //验证不通过
            throw new ParameterException(['msg'=>'商品参数验证不通过,请检查参数']);
        }
    }

}