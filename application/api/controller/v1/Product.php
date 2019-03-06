<?php
/**
 * Created by PhpStorm.
 * User: xiaolu
 * Date: 2018/6/15
 * Time: 20:42
 */

namespace app\api\controller\v1;


use app\api\model\Product as ProductModel;
use app\api\validate\Count;
use app\api\validate\IDMustBePostiveInt;
use app\lib\exception\ProductException;

class Product
{

    /**
     * 默认获取15条最新品
     * @url /api/v1/product/recent
     * @param int $count
     * @throws \think\Exception
     */
    public function getRecent($count = 15)
    {
        (new Count())->goCheck();
        $products = ProductModel::getMostRecent($count);
        //异常处理
        if(!$products){
            throw new ProductException();
        }
        //用数据集来临时隐藏summary字段
        $collection = collection($products);
        $products = $collection->hidden(['summary']);
        return json($products);
    }

    /**
     * @param $id
     * @return \think\response\Json
     * @throws ProductException
     * @throws \think\Exception
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function getAllCategory($id)
    {
        (new IDMustBePostiveInt())->goCheck();
        $products = ProductModel::getProductByCategoryID($id);
        if(!$products)
        {
            throw new ProductException();
        }
        //用数据集来临时隐藏summary字段
        $collection = collection($products);
        $products = $collection->hidden(['summary']);
        return json($products);
    }

    /**
     * @param $id
     * @throws \think\Exception
     */
    public function getOneProduct($id)
    {
        (new IDMustBePostiveInt())->goCheck();
        $result = ProductModel::getProductDetail($id);
        return json($result);
    }

    /**
     * 删除指定商品(需要管理员权限)
     * @param $id
     * @throws \think\Exception
     */
    public function deleteOneProduct($id)
    {
        (new IDMustBePostiveInt())->goCheck();
    }


}