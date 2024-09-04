<?php

namespace app\controllers;

use app\models\Response;
use app\models\ShiftType;

class ShiftTypeController extends DefaultRestController
{
    public function actionIndex()
    {
        return new Response(true, self::SUCCESS, ShiftType::find()->all());
    }

}
