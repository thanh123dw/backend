<?php

namespace app\controllers;

use app\models\Response;
use app\models\ShiftType;
use app\models\WorkSchedule;
use app\models\form\WorkScheduleForm;
use Yii;
use yii\helpers\ArrayHelper;
class WorkScheduleController extends DefaultRestController
{
    /**
     * List
     */
    public function actionIndex($ids)
    {
        return new Response(true, self::SUCCESS, WorkSchedule::getAll($ids));
    }

    /**
     * Get
     */
    public function actionGet($id)
    {
        $model = WorkSchedule::findOne($id);
        if (empty($model)) {
            return new Response(false, self::PARAM_INVALID);
        }

        return new Response(true, self::SUCCESS, [
            'model' => $model,
            'shifttype' => ShiftType::find()->all()
        ]);
    }

    public function actionSave()
    {
        $form = new WorkScheduleForm();
        $form->setAttributes(Yii::$app->getRequest()
            ->getBodyParams(), false);

        $model = WorkSchedule::findOne($form->id);
        if (empty($model)) {
            $model = new WorkSchedule();
        }

        $model->setAttributes(ArrayHelper::toArray($form), false);

        if ($model->save(false)) {
            return new Response(true, self::SUCCESS, $model);
        }

        return new Response(false, self::FAIL);
    }
}
