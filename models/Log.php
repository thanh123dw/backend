<?php

namespace app\models;

use app\controllers\DefaultController;

/**
 * This is the model class for table "a_log".
 *
 * @property int $id
 * @property string $logdate
 * @property string $logtime
 * @property string|null $page
 * @property string|null $actionname
 * @property int|null $userid
 * @property string|null $username
 * @property string|null $description
 */
class Log extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'log';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['logdate', 'logtime'], 'required'],
            [['logdate', 'logtime'], 'safe'],
            [['userid'], 'integer'],
            [['description'], 'string'],
            [['page'], 'string', 'max' => 100],
            [['actionname', 'username'], 'string', 'max' => 255],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'logdate' => 'Logdate',
            'logtime' => 'Logtime',
            'page' => 'Page',
            'actionname' => 'Actionname',
            'userid' => 'Userid',
            'username' => 'Username',
            'description' => 'Description',
        ];
    }

    public static function create($userId, $username, $page, $actionName, $description)
    {
        try {
            $date = DefaultController::getSessionDay();
            $currentDate = $date->format('Y-m-d');
            $currentTime = date('H:i:s');
            $log = new Log();
            $log->logdate = $currentDate;
            $log->logtime = $currentTime;
            $log->page = $page;
            $log->actionname = $actionName;
            $log->userid = $userId;
            $log->username = $username;
            $log->description = $description;
            $log->save(false);
        } catch (\Exception $e) {
            \Yii::error($e, "CREATE_LOG");
        }
    }
}
