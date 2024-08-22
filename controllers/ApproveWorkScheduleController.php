<?php
namespace app\controllers;

use app\models\ApproveWorkSchedule;
use app\models\Response;
use app\models\ShiftType;
use app\models\form\ApproveWorkScheduleForm;
use Yii;
use yii\helpers\ArrayHelper;

class ApproveWorkScheduleController extends DefaultRestController
{

    public function actionIndex($ids)
    {
        return new Response(true, self::SUCCESS, ApproveWorkSchedule::getAll($ids));
    }

    public function actionGet($id)
    {
        $model = ApproveWorkSchedule::findOne($id);
        if (empty($model)) {
            return new Response(false, self::PARAM_INVALID);
        }

        return new Response(true, self::SUCCESS, [
            'model' => $model,
            'shifttype' => ShiftType::find()->all()
        ]);
    }

    /**
     * Save
     */
    public function actionSave()
    {
        $form = new ApproveWorkScheduleForm();
        $form->setAttributes(Yii::$app->getRequest()
            ->getBodyParams(), false);

        $model = ApproveWorkSchedule::findOne($form->id);
        if (empty($model)) {
            $model = new ApproveWorkSchedule();
        }

        $model->setAttributes(ArrayHelper::toArray($form), false);

        if ($model->save(false)) {
            return new Response(true, self::SUCCESS, $model);
        }

        return new Response(false, self::FAIL);
    }
}


