<?php
namespace app\models\form;

use yii\base\Model;

class WorkScheduleForm extends Model
{
    public $id;

    public $staffid;

    public $workdate;

    public $starttime;

    public $endtime;

    public $shifttype;

    public $description;

    public $locked;
}