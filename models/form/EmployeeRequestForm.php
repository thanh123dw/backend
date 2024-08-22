<?php
namespace app\models\form;

use yii\base\Model;

class EmployeeRequestForm extends Model
{
    public $id;

    public $employeeid;

    public $requesttypeid;

    public $requestdate;

    public $status;

    public $requestdetails;

    public $locked;
}