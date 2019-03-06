<?php
/**
 * Created by PhpStorm.
 * User: xiaolu
 * Date: 2018/6/11
 * Time: 17:33
 */

namespace app\api\controller\v2;

use app\api\model\Banner as BannerModel;
use app\api\validate\IDMustBePostiveInt;
use app\lib\exception\BannerMissException;
use think\Exception;

class Banner
{


    /**
     * 用于获取传入id的banner
     * @url banner/:id
     * @http  get
     * @param $id
     * @throws Exception
     */
    public function getBanner($id){
        //类似于拦截器，验证传入的id是否为正整数
        (new IDMustBePostiveInt)->goCheck();
        //调用model层获取指定的banner,这里需要处理异常

         $banner = BannerModel::getBannerByID($id);

        //如果获取的banner为空，则抛出异常
        if(!$banner){
            throw new BannerMissException();
//            throw new Exception('服务器内部问题');
        }

        //成功则返回获取到的banner
        return json($banner);


    }

}