<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "workschedule".
 *
 * @property int $id
 * @property int $staffid
 * @property string $workdate
 * @property string $starttime
 * @property string $endtime
 * @property string|null $shifttype
 * @property string|null $description
 * @property string|null $createdat
 * @property string|null $updatedat
 * @property int $locked
 */
class WorkSchedule extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'workschedule';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['staffid', 'workdate', 'starttime', 'endtime'], 'required'],
            [['staffid'], 'integer'],
            [['workdate', 'starttime', 'endtime', 'createdat', 'updatedat'], 'safe'],
            [['description'], 'string'],
            [['shifttype'], 'string', 'max' => 50],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'staffid' => 'Staffid',
            'workdate' => 'Workdate',
            'starttime' => 'Starttime',
            'endtime' => 'Endtime',
            'shifttype' => 'Shifttype',
            'description' => 'Description',
            'createdat' => 'Createdat',
            'updatedat' => 'Updatedat',

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
                'staffid',
                $staffIds
            ]);
        }
        return $results->all();
    }
}
