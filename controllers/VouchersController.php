<?php

namespace app\controllers;

use app\models\Response;
use app\models\Vouchers;

class VouchersController extends DefaultRestController
{
    public function actionIndex()
    {
        return new Response(true, self::SUCCESS, Vouchers::find()->all());
    }
}
