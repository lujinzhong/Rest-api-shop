<?php
/**
 * Created by PhpStorm.
 * User: xiaolu
 * Date: 2018/6/14
 * Time: 19:41
 */

namespace app\api\model;


use app\lib\exception\ProductException;

class Product extends BaseModel
{
    //要隐藏的属性
    protected $hidden = [
      'delete_time','main_img_id','pivot','from','category','create_time','update_time'
    ];

    /**
     * product表关联查询放在productImg的产品图片
     */
    public function imgs()
    {
        //一对多
      return   $this->hasMany('ProductImage','product_id','id');

    }

    /**
     * product表关联查询productProperty的产品细节
     */
    public function properties()
    {
        //一对多
       return $this->hasMany('ProductProperty','product_id','id');

    }

     /*
      ·* 加图片前缀
      */
    public function getMainImgUrlAttr($id,$data)
    {
        return $this->prefixImgUrl($id,$data);
    }

    /**
     * @param $count
     * @return false|\PDOStatement|string|\think\Collection
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     *
     */
    public static function getMostRecent($count)
    {
        $products = self::limit($count)->order('create_time','desc')->select();
        return $products;
    }

    /**
     * @param $categoryID
     * @throws ProductException
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public static function  getProductByCategoryID($categoryID)
    {

        $products = self::where('category_id','=',$categoryID)->select();
        if(!$products){
            throw new ProductException();
        }
        return $products;

    }



    /**
     * 根据获取商品详情
     * @param $id
     * @return array|false|\PDOStatement|string|\think\Model
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public static function getProductDetail($id)
    {
//           $productDetail = self::with(['imgs.imgUrl','properties'])->find($id);
       //闭包函数查询构建器
        $productDetail = self::with([
            'imgs' => function($query){
           $query->with(['imgUrl'])->order('order','asc');
            }
        ])->with('properties')->find($id);
        return $productDetail;
    }


}