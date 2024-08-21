<?php
namespace app\models\form;

use yii\base\Model;

/**
 * LoginForm is the model behind the login form.
 *
 * @property-read User|null $user
 *
 */
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
}