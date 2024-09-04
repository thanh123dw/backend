<?php

namespace app\controllers;

use app\models\ApproveWorkSchedule;
use app\models\form\ApproveWorkScheduleForm;
use app\models\Response;
use app\models\ShiftType;
use app\models\WorkSchedule;
use yii\helpers\ArrayHelper;
use Yii;

class ApproveWorkScheduleController extends DefaultRestController
{

    public function actionIndex()
    {
        return new Response(true, self::SUCCESS, ApproveWorkSchedule::findAll(['status' => 0]));
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

    public function actionSave($id, $action)
    {
        $model = ApproveWorkSchedule::findOne($id);
        if (empty($model)) {
            return new Response(false, self::PARAM_INVALID);
        }
        if ($action == 'approve' || $action == 'reject') {
            $model->status = 1;
            if ($action == 'approve') {
                $workShedule = WorkSchedule::findOne($model->workscheduleid);
                if (empty($workShedule)) {
                    return new Response(false, self::PARAM_INVALID, $workShedule);
                }
                $attributes = ArrayHelper::toArray($model);
                unset($attributes['id']);

                $workShedule->setAttributes($attributes, false);
                $workShedule->updatedat = date('Y-m-d H:i:s');
            }

            if ($model->save(false) && $workShedule->save(false)) {
                return new Response(true, self::SUCCESS, $model);
            }
        }
        return new Response(false, self::FAIL);
    }

    public function actionRequest()
    {
        $model = new ApproveWorkSchedule();
        if ($this->request->isPost && $model->load($this->request->post())) {
            if ($model->save(false)) {

                return new Response(true, self::SUCCESS, $model);
            }
            return new Response(false, self::FAIL);
        }
    }
}
