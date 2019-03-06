<?php
/**
 * Created by PhpStorm.
 * User: xiaolu
 * Date: 2018/6/12
 * Time: 21:50
 */

namespace app\lib\exception;


use Exception;
use think\exception\Handle;
use think\Log;

class ExceptionHandler extends Handle
{
    private $code ;
    private $msg ;
    private $errorCode;
    /**
     * 这里我们重写了handle的render方法，需要在配置文件定义Exception_Handler路径
     * @param Exception $e
     * @return \think\Response|\think\response\Json
     */

    //这里因为tp封装了两个异常处理类，一个是HttpException,所以下面传入
    //的应该是基类Exception的对象，不然无法捕捉HttpException
    public function render(Exception $e)
    {

        //这里判断是否为BaseException类，如果是则为用户方的异常处理
        if($e instanceof BaseException) {
            //如果是的话
            $this->code = $e->code;
            $this->msg = $e->msg;
            $this->errorCode = $e->errorCode;

        }else{
            //如果是服务器的问题
            //开发模式下我们根据app_debug的值来判断使用系统默认的异常页面或者自定义的
            if(config('app_debug')){
                //调用父类的render
                return parent::render($e);
            }else{
                $this->code = '500';
                $this->msg = '服务器内部错误,不想告诉你';
                $this->errorCode = '999';

            }

            //写入日志
            $this->recordErrorLog($e);

        }
        $result = [
          'msg' =>$this->msg,
          'errorCode' => $this->errorCode,
          'request_url' =>request()->url()
        ];
        return json($result,$this->code);

    }
    //定义一个写日志的方法
    private function recordErrorLog(Exception $e)
    {
        //这里需要初始化日志功能，因为默认的被关了
        Log::init([
            'type' => 'File',
            'path' => LOG_PATH,
            'level'=>['error']
        ]);
        //记录信息为报错的信息，等级为error
        Log::record($e->getMessage(),'error');
    }


}