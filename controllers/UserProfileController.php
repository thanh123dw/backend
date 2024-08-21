<?php
namespace app\controllers;

use app\models\LoginForm;
use app\models\Response;
use app\models\UserProfile;
use Yii;
use yii\helpers\ArrayHelper;
use app\models\form\UserProfileForm;
use app\models\Log;

/**
 * UserProfileController implements the CRUD actions for UserProfile model.
 */
class UserProfileController extends DefaultRestController
{

    public function actionIndex($id)
    {
        return new Response(true, self::SUCCESS, UserProfile::findOne($id));
    }

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

        $user = $model->getUser();
        if ($user === null) {
            return new Response(false, '1' . Yii::t('app', 'usernameOrPasswordIncorrect'));
        }

        $currentUser = $model->login();
        if (empty($currentUser)) {
            return new Response(false, '2' . Yii::t('app', 'usernameOrPasswordIncorrect'));
        }

        Yii::$app->session->set('staffIds', $currentUser->staffids);
        $userDto = new UserProfileForm();
        $userDto->setAttributes(ArrayHelper::toArray($currentUser), false);
        Log::create($currentUser->id, $currentUser->username, 'Login', 'login', '');

        // Trả về thông tin người dùng nếu đăng nhập thành công
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
