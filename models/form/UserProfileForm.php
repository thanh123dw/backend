<?php
namespace app\models\form;

use yii\base\Model;

class UserProfileForm extends Model
{
    public $id;

    public $employee_id;

    public $fullname;

    public $username;

    public $idcard;

    public $taxcode;

    public $address;

    public $phonenumber;

    public $bankaccountnumber;

    public $password;

    public $token;

    public $created_at;

    public $staffids ;
    public     $point ;
    public  $locked;
}