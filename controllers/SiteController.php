<?php
namespace app\controllers;

use Yii;
use yii\web\Controller;
use yii\web\Response;

class SiteController extends Controller
{

    public function actionIndex()
    {
        return $this->render('index');
    }

    /**
     * Login action.
     *
     * @return Response|string
     */


    /**
     * Logout action.
     *
     * @return Response
     */
    public function actionLogout()
    {
        Yii::$app->user->logout();

        return $this->goHome();
    }

    // /**
    // * Displays contact page.
    // *
    // * @return Response|string
    // */
    // public function actionContact()
    // {
    // $model = new ContactForm();
    // if ($model->load(Yii::$app->request->post()) && $model->contact(Yii::$app->params['adminEmail'])) {
    // Yii::$app->session->setFlash('contactFormSubmitted');

    // return $this->refresh();
    // }
    // return $this->render('contact', [
    // 'model' => $model,
    // ]);
    // }

    // /**
    // * Displays about page.
    // *
    // * @return string
    // */
    // public function actionAbout()
    // {
    // return $this->render('about');
    // }
}
