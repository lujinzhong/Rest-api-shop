<?php
/**
 * Created by PhpStorm.
 * User: xiaolu
 * Date: 2018/6/14
 * Time: 19:40
 */

namespace app\api\controller\v1;


use app\api\validate\IDCollection;
use app\api\model\Theme as ThemeModel;
use app\api\validate\IDMustBePostiveInt;
use app\lib\exception\ThemeException;

class Theme
{
    /**
     * @param string $id
     * @url api/:version/theme?id=1,2,3
     * @throws
     */

    public function getSimpleList($ids ='')
    {
            //验证获取到的IDS是否符合规则
            (new IDCollection())->goCheck();
            //查询数据
        $ids = explode(',',$ids);

        //这里要写异常处理，当有不存在的themeid时
        $result = ThemeModel::with('topicImg,headImg')->select($ids);

       if(!$result){
           throw new ThemeException();
       }


        return json($result);
    }

    /**
     * @param $id
     * @url api/v1/theme/1
     * @return \think\response\Json
     * @throws ThemeException
     * @throws \think\Exception
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function getComplexOne($id)
    {
        //检测id是否为正整数
        (new IDMustBePostiveInt())->goCheck();
        $theme = ThemeModel::getThemeWithProducts($id);
        if(!$theme){
            throw new ThemeException();
        }
        return json($theme);
    }

}