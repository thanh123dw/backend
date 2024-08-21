<?php
namespace app\models;

use yii\base\Model;

class Response extends Model
{

    public $success = true;

    public $message;

    public $data;

    function __construct($success = true, $message = "SUCCESS", $data = "")
    {
        $this->success = $success;
        $this->message = $message;
        $this->data = $data;
    }
}