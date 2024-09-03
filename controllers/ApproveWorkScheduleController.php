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

    public function actionIndex()
    {
        return new Response(true, self::SUCCESS, ApproveWorkSchedule::findAll(['<>', 'locked', null]));
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
    public function actionApprove()
    {
        $model = new ApproveWorkSchedule();
        if ($this->request->isPost && $model->load($this->request->post())) {

            if ($model->save(false)) {

                return new Response(true, self::SUCCESS, $model);
            }
            return new Response(false, self::FAIL);
        }
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
