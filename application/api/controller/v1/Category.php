<?php
/**
 * Created by PhpStorm.
 * User: xiaolu
 * Date: 2018/6/15
 * Time: 22:10
 */

namespace app\api\controller\v1;

use app\api\model\Category as CategoryModel;
use app\lib\exception\CategoryException;

class Category
{
    //获取所有的分类

    /**
     * @return \think\response\Json
     * @throws CategoryException
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function getAllCategories()
   {
       //获取所有分类信息
       $categories = CategoryModel::with('img')->select();
        if(!$categories)
        {
            throw new CategoryException();
        }
       return json($categories);

   }

}