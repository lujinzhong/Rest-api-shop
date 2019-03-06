<?php
/**
 * Created by PhpStorm.
 * User: xiaolu
 * Date: 2018/6/15
 * Time: 13:37
 */

namespace app\api\validate;

class IDCollection extends BaseValidate
{
    //规则
    protected $rule =[
      'ids'=>'require|checkIDS'

    ];
    //错误信息
    protected $message =[

        'ids' =>'ids参数必须是以逗号隔开的多个正整数组成'
    ];

    /**
     * @param $value
     * @return bool
     * @throws
     */
    protected function checkIDS($value)
    {
       //根据逗号分隔
        $values = explode(',',$value);
        //判断是否为空
        if(empty($values))
        {
            return false;
        }
        //循环验证id是否为正整数
        foreach ($values as $id)
        {

            if(!$this->IsPostiveInteger($id))
            {
                //如果传入的id有非正整数的则返回false
                return false;
            }


        }
        return true;
    }


}