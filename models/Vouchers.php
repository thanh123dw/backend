<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "vouchers".
 *
 * @property int $id
 * @property string $name
 * @property string $code
 * @property int $point
 * @property string $valid_to
 * @property string|null $image_url
 */
class Vouchers extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'vouchers';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id', 'name', 'code', 'point', 'valid_to'], 'required'],
            [['id', 'point'], 'integer'],
            [['valid_to'], 'safe'],
            [['name', 'image_url'], 'string', 'max' => 255],
            [['code'], 'string', 'max' => 50],
            [['id'], 'unique'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'name' => 'Name',
            'code' => 'Code',
            'point' => 'Point',
            'valid_to' => 'Valid To',
            'image_url' => 'Image Url',
        ];
    }
}
