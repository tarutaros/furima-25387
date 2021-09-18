# テーブル設計

##usersテーブル

|Column              |Type    |Options                  |
|--------------------|--------|-------------------------|
|nickname            |string  |null:false               |
|email               |string  |null:false, unique:true  |
|encrypted_password  |string  |null:false               |
|family_name         |string  |null:false               |
|first_name          |string  |null:false               |
|family_name_kana    |string  |null:false               |
|first_name_kana     |string  |null:false               |
|birthday            |date    |null:false               |


### Association
has_many :items, dependent: :destroy
has_many :items_histories, dependent: :destroy




##itemsテーブル

|Column            |Type        |Options                       |
|------------------|------------|------------------------------|
|name              |string      |null:false                    |
|text              |text        |null:false                    |
|category_id       |integer     |null:false                    |
|status_id         |integer     |null:false                    |
|load_id           |integer     |null:false                    |
|delivery_area_id  |integer     |null:false                    |
|delivery_days_id  |integer     |null:false                    |
|price             |integer     |null:false                    |
|user              |references  |null:false, foreign_key:true  |
<!-- imageはActiveStorageで実装 -->


### Association
belongs_to :user
has_one :items_history, dependent: :destroy


##items_historiesテーブル

|Column            |Type        |Options                       |
|------------------|------------|------------------------------|
|user              |references  |null:false, foreign_key:true  |
|item              |references  |null:false, foreign_key:true  |



### Association
has_one :destination
belongs_to :item
belongs_to :user




##destinationsテーブル

|Column             |Type        |Options                      |
|-------------------|------------|-----------------------------|
|post_code          |string      |null:false                   |
|delivery_area_id   |integer     |null:false                   |
|city               |string      |null:false                   |
|address            |string      |null:false                   |
|building_name      |string      |                             |
|phone_number       |string      |null:false                   |
|items_history      |references  |null:false, foreign_key:true |


### Association
belongs_to :items_history, dependent: :destroy