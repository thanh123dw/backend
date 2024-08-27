<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "pointlog".
 *
 * @property int $id
 * @property int $senderid
 * @property string $sendername
 * @property int $receiverid
 * @property string $receivername
 * @property int $pointsadded
 * @property string|null $createdat
 */
class PointLog extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'pointlog';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['senderid', 'sendername', 'receiverid', 'receivername', 'pointsadded'], 'required'],
            [['senderid', 'receiverid', 'pointsadded'], 'integer'],
            [['createdat'], 'safe'],
            [['sendername', 'receivername'], 'string', 'max' => 255],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'senderid' => 'Senderid',
            'sendername' => 'Sendername',
            'receiverid' => 'Receiverid',
            'receivername' => 'Receivername',
            'pointsadded' => 'Pointsadded',
            'createdat' => 'Createdat',
        ];
    }
}
