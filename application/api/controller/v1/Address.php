<?php
/**
 * Created by PhpStorm.
 * User: xiaolu
 * Date: 2018/6/19
 * Time: 17:14
 */

namespace app\api\controller\v1;


use app\api\controller\BaseController;
use app\api\model\User as UserModel;
use app\api\service\Token as TokenService;
use app\api\validate\AddressNew;
use app\lib\exception\SuccessMessage;
use app\lib\exception\UserException;

class Address extends BaseController
{
    //使用前置方法检查权限
    protected $beforeActionList=[
        'checkPrimaryScope'=> ['only'=>'createUpdateAddress'],
    ];



    /**
     * 查询新增用户地址
     * @throws \think\Exception
     */
    public function createUpdateAddress()
    {
        $validate = new AddressNew();
        $validate->goCheck();
        //根据token获取UID
        $uid = TokenService::getCurrentUid();
        //判断该用户是否存在
        $user =UserModel::get($uid);
        if(!$user){
           throw new UserException();
        }

        //获取用户从客户端提交来的地址信息
        $data = $validate->getValueByRule(input('post.'));
        //根据用户地址信息是否存在从而判断是添加地址还是更新地址
        $userAddress = $user->address;
        //非空则为更新
        if(!$userAddress){
            $user->address()->save($data);
        }else{
            $user->address->save($data);
        }
        return json(new SuccessMessage(),201);

    }


}