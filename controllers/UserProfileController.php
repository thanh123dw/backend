<?php
namespace app\controllers;

use app\models\LoginForm;
use app\models\Response;
use app\models\UserProfile;
use Yii;
use yii\helpers\ArrayHelper;
use app\models\form\UserProfileForm;
use app\models\Log;

class UserProfileController extends DefaultRestController
{

    // lấy ra thông tin 1 nhân viên
    public function actionGet($id)
    {
        return new Response(true, self::SUCCESS, UserProfile::findOne($id));
    }

    // lấy ra thông tin các nhân viên cần quản lí
    public function actionGetStaff($ids)
    {
        return new Response(true, self::SUCCESS, UserProfile::getAll($ids));
    }

    // thêm point cho 1 người, point âm thì là tặng
    public function actionAddPointToStaff($id, $plus)
    {
        $model = UserProfile::findOne($id);

        if (! $model) {
            return new Response(true, self::FAIL);
        }
        $model->point = max(0, $model->point + $plus);
        if ($model->save(false)) {
            return new Response(true, self::SUCCESS, $model);
        }

        return new Response(false, self::FAIL);
    }

    // thêm point cho nhiều người, cập nhật hàng tháng
    public function actionAddPointToAll($plus)
    {
        // Tìm tất cả các UserProfile có trong danh sách $ids và có trường locked khác true
        $models = UserProfile::find()->andWhere([
            '<>',
            'locked',
            1
        ])->all();

        // Nếu không tìm thấy model nào, trả về response thất bại
        if (empty($models)) {
            return new Response(false, self::FAIL);
        }

        // Lặp qua từng model để cộng điểm
        foreach ($models as $model) {
            $model->point = max(0, $model->point + $plus);
            // Lưu lại model
            if (! $model->save(false)) {
                return new Response(false, self::FAIL);
            }
        }

        // Trả về response thành công nếu tất cả đều cập nhật thành công
        return new Response(true, self::SUCCESS);
    }

    // cập nhật thông tin nhân viên
    public function actionSave()
    {
        $form = new UserProfileForm();
        $form->setAttributes(Yii::$app->getRequest()
            ->getBodyParams(), false);

        $model = UserProfile::findOne($form->id);
        if (empty($model)) {
            $model = new UserProfile();
        }

        $model->setAttributes(ArrayHelper::toArray($form), false);

        if ($model->save(false)) {
            return new Response(true, self::SUCCESS, $model);
        }

        return new Response(false, self::FAIL);
    }

    public function actionLogin()
    {
        $model = new LoginForm();

        // Lấy dữ liệu từ body của request
        $requestData = Yii::$app->getRequest()->getBodyParams();

        // Gán dữ liệu vào model bằng setAttributes
        $model->setAttributes($requestData, false);

        $user = Userprofile::findByUserName($model->username, $model->password);
        $user->username = null;
        $user->password = null;

        if ($user === null) {
            return new Response(false, Yii::t('app', 'usernameOrPasswordIncorrect'));
        }

        $currentUser = $model->login();
        if (empty($currentUser)) {
            return new Response(false, Yii::t('app', 'usernameOrPasswordIncorrect'));
        }

        Yii::$app->session->set('staffIds', $currentUser->staffids);
        $userDto = new UserProfileForm();
        $userDto->setAttributes(ArrayHelper::toArray($currentUser), false);
        Log::create($currentUser->id, $currentUser->username, 'Login', 'login', '');

        return new Response(true, self::SUCCESS, $user);
    }

    public function actionLogout()
    {
        $model = new LoginForm();
        if ($model->load(Yii::$app->getRequest()
            ->getBodyParams(), '')) {
            $currentUser = $model->getUser();
            $model->logout();
            Log::create($currentUser->id, $currentUser->username, 'Logout', 'logout', '');
        }
        return new Response();
    }
}
