<?php
namespace app\controllers;

use app\models\Response;
use Yii;
use yii\helpers\ArrayHelper;
use app\models\EmployeeRequest;
use app\models\form\EmployeeRequestForm;
use app\models\RequestType;

/**
 * EmployeeRequestController implements the CRUD actions for EmployeeRequest model.
 */
class EmployeeRequestController extends DefaultRestController
{

    /**
     * List
     */
    public function actionIndex($ids)
    {
        return new Response(true, self::SUCCESS, EmployeeRequest::getAll($ids));
    }

    /**
     * Get
     */
    public function actionGet($id)
    {
        $model = EmployeeRequest::findOne($id);
        if (empty($model)) {
            return new Response(false, self::PARAM_INVALID);
        }

        return new Response(true, self::SUCCESS, [
            'employeerequest' => $model,
            'requesttype' => RequestType::find()->all()
        ]);
    }

    /**
     * Save
     */
    public function actionSave()
    {
        $form = new EmployeeRequestForm();
        $form->setAttributes(Yii::$app->getRequest()
            ->getBodyParams(), false);

        $model = EmployeeRequest::findOne($form->id);
        if (empty($model)) {
            $model = new EmployeeRequest();
        }

        $model->setAttributes(ArrayHelper::toArray($form), false);

        if ($model->save(false)) {
            return new Response(true, self::SUCCESS, $model);
        }

        return new Response(false, self::FAIL);
    }
}
