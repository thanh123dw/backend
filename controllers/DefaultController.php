<?php
namespace app\controllers;

use Yii;
use yii\web\Controller;

class DefaultController extends Controller
{

    const VN_LANGUAGE = "vi-VN";

    const EN_LANGUAGE = "en-US";

    public static function getUnitPrefix($level, $type)
    {
        return Yii::t("app", "adminUnitMsg")[strval($level)][strval($type)];
    }

    public static function getSessionDay()
    {
        return new \DateTime('now');
    }

    public static function getUnitLabel($level, $obj, $lang)
    {
        $prefix = self::getUnitPrefix($level, $obj["type"]);

        if ($lang == self::VN_LANGUAGE) {
            return $prefix . " " . $obj["name"];
        }

        $objName = $obj["nameEN"];

        if (is_numeric($objName)) {
            return $prefix . " " . $objName;
        }

        return $objName . " " . $prefix;
    }

    public static function getUserId()
    {
        return (isset(Yii::$app->user->identity->id)) ? Yii::$app->user->identity->id : null;
    }
}