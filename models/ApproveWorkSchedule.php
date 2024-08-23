<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "approveworkschedule".
 *
 * @property int $id
 * @property int $workscheduleid
 * @property int $staffid
 * @property string $workdate
 * @property string $starttime
 * @property string $endtime
 * @property string|null $shifttype
 * @property string|null $description
 * @property int $status
 * @property int|null $locked
 * @property string|null $createdat
 * @property string|null $updatedat
 * @property string|null $reason
 */
class ApproveWorkSchedule extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'approveworkschedule';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['workscheduleid', 'staffid', 'workdate', 'starttime', 'endtime'], 'required'],
            [['workscheduleid', 'staffid', 'status', 'locked'], 'integer'],
            [['workdate', 'starttime', 'endtime', 'createdat', 'updatedat'], 'safe'],
            [['description'], 'string'],
            [['shifttype'], 'string', 'max' => 50],
            [['reason'], 'string', 'max' => 255],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'workscheduleid' => 'Workscheduleid',
            'staffid' => 'Staffid',
            'workdate' => 'Workdate',
            'starttime' => 'Starttime',
            'endtime' => 'Endtime',
            'shifttype' => 'Shifttype',
            'description' => 'Description',
            'status' => 'Status',
            'locked' => 'Locked',
            'createdat' => 'Createdat',
            'updatedat' => 'Updatedat',
            'reason' => 'Reason',
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
