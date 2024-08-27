<?php

namespace app\controllers;
use app\models\PointLog;
use app\models\Response;

class PointLogController extends DefaultRestController
{
    public function actionGetPointLog($userId)
    {
        // Tìm các bản ghi trong bảng pointlog mà userId là sender hoặc receiver
        $logs = PointLog::find()
            ->where(['senderid' => $userId])
            ->orWhere(['receiverid' => $userId])
            ->all();

        // Nếu không có bản ghi nào, trả về response thất bại
        if (empty($logs)) {
            return new Response(false, self::FAIL, 'No logs found for this user.');
        }

        // Trả về response thành công cùng với danh sách các log
        return new Response(true, self::SUCCESS, $logs);
    }
}
