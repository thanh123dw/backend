<?php

namespace app\controllers;

use Yii;
use yii\rest\Controller;

class DefaultRestController extends Controller
{

    const SUCCESS = "SUCCESS";

    const FAIL = "FAIL";

    const PARAM_INVALID = "PARAM_IS_NOT_VALID";

    public function behaviors()
    {
        $behaviors = parent::behaviors();

        $behaviors['corsFilter'] = [
            'class' => \yii\filters\Cors::className(),
            'cors' => [
                'Origin' => Yii::$app->params["corsOrigin"],
                'Access-Control-Request-Method' => [
                    'GET',
                    'POST',
                    'PUT',
                    'PATCH',
                    'DELETE',
                    'HEAD',
                    'OPTIONS'
                ],
                'Access-Control-Request-Headers' => [
                    '*'
                ]
            ]
        ];

        return $behaviors;
    }

    public static function miliSecond()
    {
        $microtime = microtime();
        $comps = explode(' ', $microtime);

        return sprintf('%d%03d', $comps[1], $comps[0] * 1000);
    }
}
