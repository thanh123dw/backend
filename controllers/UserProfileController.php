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

    // thêm point cho 1 người lưu log lại
    public function actionAddPointToStaff($senderId, $receiverId, $plus)
    {
        $sender = UserProfile::findOne($senderId);
        $receiver = UserProfile::findOne($receiverId);

        if (!$sender || !$receiver) {
            return new Response(false, self::FAIL);
        }

        $receiver->point = max(0, $receiver->point + $plus);
        if ($receiver->save(false)) {
            // Ghi log
            Yii::$app->db->createCommand()->insert(
                'pointlog',
                [
                    'senderid' => $sender->id,
                    'sendername' => $sender->fullname,
                    'receiverid' => $receiver->id,
                    'receivername' => $receiver->fullname,
                    'pointsadded' => $plus
                ]
            )->execute();

            return new Response(
                true,
                self::SUCCESS,
                $receiver
            );
        }

        return new Response(false, self::FAIL);
    }


    public function actionAddPointToAll($plus)
    {
        // Tìm tất cả các UserProfile có trường 'locked' khác 1
        $models = UserProfile::find()->where(['<>', 'locked', 1])->all();

        // Nếu không tìm thấy model nào, trả về response thất bại
        if (empty($models)) {
            return new Response(false, self::FAIL);
        }

        // Lặp qua từng model để cộng điểm
        foreach ($models as $model) {
            /** @var UserProfile $model */
            // Cộng thêm điểm và đảm bảo điểm không âm
            $model->point = max(0, $model->point + $plus);

            // Lưu lại model
            if (!$model->save(false)) {
                return new Response(false, self::FAIL);
            }

            // Ghi log vào bảng pointlog
            Yii::$app->db->createCommand()->insert('pointlog', [
                'senderid' => null, // Không có người gửi cụ thể, nên để null
                'sendername' => 'System', // Hoặc một tên đại diện như 'System'
                'receiverid' => $model->id,
                'receivername' => $model->fullname, // Dùng trường 'fullname' của UserProfile
                'pointsadded' => $plus,
                'createdat' => date('Y-m-d H:i:s') // Ghi thời gian hiện tại
            ])->execute();
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

        // Tìm người dùng bằng username và password
        $user = UserProfile::findByUserName($model->username, $model->password);

        if ($user === null) {
            return new Response(false, Yii::t('app', 'usernameOrPasswordIncorrect'));
        } else {
            /** @var UserProfile $user */
            $user->username = null;
            $user->password = null;
        }

        // Đăng nhập và lấy thông tin người dùng hiện tại
        $currentUser = $model->login();
        if ($currentUser === null) {
            return new Response(false, Yii::t('app', 'usernameOrPasswordIncorrect'));
        }
        /** @var UserProfile $currentUser */

        Yii::$app->session->set('staffIds', $currentUser->staffids);

        // Chuyển đổi thông tin người dùng hiện tại thành UserProfileForm
        $userDto = new UserProfileForm();
        $userDto->setAttributes(ArrayHelper::toArray($currentUser), false);

        // Ghi log hoạt động đăng nhập
        Log::create($currentUser->id, $currentUser->username, 'Login', 'login', '');

        return new Response(true, self::SUCCESS, $userDto);
    }

   public function actionLogout()
{
    $model = new LoginForm();

    if ($model->load(Yii::$app->getRequest()->getBodyParams(), '')) {
        $currentUser = $model->getUser();
            /** @var UserProfile $currentUser */
        if ($currentUser !== null) {
            $model->logout();
            // Ghi log hoạt động đăng xuất
            Log::create($currentUser->id, $currentUser->username, 'Logout', 'logout', '');
        }
    }

    return new Response();
}
}
