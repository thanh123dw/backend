<?php
namespace app\models;

use Yii;
use yii\base\Model;

/**
 * LoginForm is the model behind the login form.
 *
 * @property-read User|null $user
 *
 */
class LoginForm extends Model
{

    public $username;

    public $password;

    public $rememberMe = true;

    private $_user = false;

    /**
     *
     * @return array the validation rules.
     */
    public function rules()
    {
        return [
            // username and password are both required
            [
                [
                    'username',
                    'password'
                ],
                'required'
            ],
            [
                'rememberMe',
                'boolean'
            ],
            [
                'password',
                'validatePassword'
            ]
        ];
    }

    public function validatePassword($attribute, $params)
    {
        if (! $this->hasErrors()) {
            $user = $this->getUser();

            if (! $user || ! $user->validatePassword($this->password)) {
                $this->addError($attribute, 'Incorrect username or password.');
            }
        }
    }

    public function login()
    {
        if ($this->getUser()) {
            Yii::$app->user->login($this->_user, $this->rememberMe ? 3600 * 24 * 30 : 0);
            return $this->_user;
        }
        return null;
    }

    public function logout()
    {
        if ($this->getUser()) {
            $this->_user->save();
            Yii::$app->user->logout();
        }
    }

    public function getUser()
    {
        $this->_user = User::findByUserName($this->username,$this->password);
        return $this->_user;
    }
}
