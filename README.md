# テーブル設計

## usersテーブル

|     Column         |  Type  |  Options    |
|--------------------|--------|-------------|
| nickname           | string | null: false |
| email              | string | null: false |
| password           | string | null: false |
| encrypted_password | string | null: false |
| last_name          | string | null: false |
| first_name         | string | null: false |
| last_name_kana     | string | null: false |
| first_name_kane    | string | null: false |
| birth_date         | date   | null: false |


### Association
has_many :items
has_many :purchases


## itemsテーブル

|      Column        |    Type    |      Options                  |
|--------------------|------------|-------------------------------|
| items_name         | string     | null: false                   |
| explanation        | text       | null: false                   |
| category_id        | integer    | null: false                   |
| status_id          | integer    | null: false                   |
| delivery_fee_id    | integer    | null: false                   |
| delivery_source_id | integer    | null: false                   |
| days_to_ship_id    | integer    | null:false                    | 
| price              | integer    | null:false                    | 
| user               | references | null:false, foreign_key: true |


### Association
belongs_to :user
has_one :purchase


## purchasesテーブル

|   Column   |    Type    |          Options              |
|------------|------------|-------------------------------|
| user       | references | null:false, foreign_key: true |
| item       | references | null:false, foreign_key: true |



### Association
belongs_to :item
belongs_to :user
has_one :address

## addressテーブル

|    Column        |    Type    |          Options             |
|------------------|------------|------------------------------|
| postal_code      | string     | null:false                   |
| prefectures_id   | integer    | null:false                   |
| municipality     | string     | null:false                   |
| street_number    | string     | null:false                   |
| building_name    | string     |                              |
| telephone_number | string     | null:false                   |
| purchase         | references | null:false, foreign_key: true|


### Association
belongs_to :purchase