# テーブル設計

##usersテーブル

|Column              |Type    |Options                  |
|--------------------|--------|-------------------------|
|nickname            |string  |null:false, unique:true  |
|email               |string  |null:false, unique:true  |
|password            |string  |null:false               |
|family_name         |string  |null:false               |
|first_name          |string  |null:false               |
|family_name_kana    |string  |null:false               |
|first_name_kana     |string  |null:false               |
|birthday            |date    |null:false               |


### Association
has_many :items, dependent: :destroy
has_one :destination, dependent: :destroy
has_one :items_history, dependent: :destroy




##itemsテーブル

|Column         |Type     |Options                       |
|---------------|---------|------------------------------|
|name           |string   |null:false                    |
|text           |text     |null:false                    |
|category       |string   |null:false                    |
|status         |string   |null:false                    |
|load           |string   |null:false                    |
|delivery_area  |string   |null:false                    |
|delivery_days  |string   |null:false                    |
|price          |integer  |null:false                    |
|user_id        |string   |null:false, foreign_key:true  |
<!-- imageはActiveStorageで実装 -->


### Association
belongs_to :user
has_one :items_history, dependent: :destroy


##items_historyテーブル

|Column            |Type    |Options                       |
|------------------|--------|------------------------------|
|user_id           |string  |null:false, foreign_key:true  |
|items_id          |string  |null:false, foreign_key:true  |



### Association
belongs_to :user
belongs_to :items
belongs_to :destination



##destinationテーブル

|Column            |Type    |Options                      |
|------------------|--------|-----------------------------|
|post_code         |string  |null:false                   |
|prefecture        |string  |null:false                   |
|city              |string  |null:false                   |
|address           |string  |null:false                   |
|building_name     |string  |                             |
|phone_number      |date    |null:false                   |
|user_id           |string  |null:false, foreign_key:true |


### Association
belongs_to :user
has_one :items_history, dependent: :destroy