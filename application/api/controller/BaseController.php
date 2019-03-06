<?php
/**
 * Created by PhpStorm.
 * User: xiaolu
 * Date: 2018/6/21
 * Time: 19:39
 */

namespace app\api\controller;


use think\Controller;
use app\api\service\Token as TokenService;
class BaseController extends Controller
{
    /**
     * @throws \app\lib\exception\ForbiddenException
     * @throws \app\lib\exception\TokenException
     * @throws \think\Exception
     */
    protected   function checkPrimaryScope()
    {

        TokenService::needPrimaryScope();

    }

    /**
     * @throws \app\lib\exception\ForbiddenException
     * @throws \app\lib\exception\TokenException
     * @throws \think\Exception
     */
    protected   function checkExclusiveScope()
    {
        TokenService::needExclusiveScope();
    }


}