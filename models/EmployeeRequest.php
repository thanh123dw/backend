<?php
namespace app\models;

use Yii;

/**
 * This is the model class for table "employeerequest".
 *
 * @property int $id
 * @property int $employeeid
 * @property int $requesttypeid
 * @property string $requestdate
 * @property int $status
 * @property string|null $requestdetails
 * @property string|null $createdat
 * @property string|null $updatedat
 * @property int $locked
 */
class EmployeeRequest extends \yii\db\ActiveRecord
{

    /**
     *
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'employeerequest';
    }

    /**
     *
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [
                [
                    'employeeid',
                    'requesttypeid',
                    'requestdate'
                ],
                'required'
            ],
            [
                [
                    'employeeid',
                    'requesttypeid',
                    'status',
                    'locked'
                ],
                'integer'
            ],
            [
                [
                    'requestdate',
                    'createdat',
                    'updatedat'
                ],
                'safe'
            ],
            [
                [
                    'requestdetails'
                ],
                'string'
            ]
        ];
    }

    /**
     *
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'employeeid' => 'Employeeid',
            'requesttypeid' => 'Requesttypeid',
            'requestdate' => 'Requestdate',
            'status' => 'Status',
            'requestdetails' => 'Requestdetails',
            'createdat' => 'Createdat',
            'updatedat' => 'Updatedat',
            'locked' => 'Locked'
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
                'employeeid',
                $staffIds
            ]);
        }
        return $results->createCommand()->getRawSql();
        return $results->all();
    }
}
