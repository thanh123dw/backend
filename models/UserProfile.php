<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "userprofile".
 *
 * @property int $id
 * @property string $employee_id
 * @property string $fullname
 * @property string $username
 * @property string $idcard
 * @property string|null $taxcode
 * @property string|null $address
 * @property string|null $phonenumber
 * @property string|null $bankaccountnumber
 * @property string $password
 * @property string|null $token
 * @property string|null $created_at
 * @property string|null $staffids
 * @property int $point
 * @property int $locked
 */
class Userprofile extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'userprofile';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['employee_id', 'fullname', 'username', 'idcard', 'password'], 'required'],
            [['address'], 'string'],
            [['created_at'], 'safe'],
            [['point', 'locked'], 'integer'],
            [['employee_id', 'username', 'idcard', 'taxcode', 'bankaccountnumber'], 'string', 'max' => 50],
            [['fullname', 'password', 'token', 'staffids'], 'string', 'max' => 255],
            [['phonenumber'], 'string', 'max' => 20],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'employee_id' => 'Employee ID',
            'fullname' => 'Fullname',
            'username' => 'Username',
            'idcard' => 'Idcard',
            'taxcode' => 'Taxcode',
            'address' => 'Address',
            'phonenumber' => 'Phonenumber',
            'bankaccountnumber' => 'Bankaccountnumber',
            'password' => 'Password',
            'token' => 'Token',
            'created_at' => 'Created At',
            'staffids' => 'Staffids',
            'point' => 'Point',
            'locked' => 'Locked',
        ];
    }

    public static function getAll($staffIds)
    {
        $results = self::find();

        if (! empty($staffIds)) {
            if (is_string($staffIds)) {
                $staffIds = explode(',', $staffIds); // Chuyển chuỗi thành mảng
            }
            // return $staffIds;
            // Lọc kết quả dựa trên các staff IDs
            $results = $results->orFilterWhere([
                'in',
                'id',
                $staffIds
            ]);
        }
        return $results->all();
    }

    public static function findByUsername($username,$password)
    {
        return self::find()
        ->where([
            'username' => $username,
            'password' => $password
        ])
        ->one();
    }
}
