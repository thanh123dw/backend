<?php
namespace app\models\form;

use yii\base\Model;

class ApproveWorkScheduleForm extends Model
{
    public $id;
    public $workscheduleid;
    public $staffid;
    public $workdate;
    public $starttime;
    public $endtime;
    public $shifttype;
    public $description;
    public $status;
    public $locked;
}