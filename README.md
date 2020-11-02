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

|      Column     |    Type    |      Options                  |
|-----------------|------------|-------------------------------|
| items_name      | string     | null: false                   |
| explanation     | text       | null: false                   |
| category        | integer    | null: false                   |
| status          | integer    | null: false                   |
| delivery_fee    | integer    | null: false                   |
| delivery_source | integer    | null: false                   |
| days_to_ship    | integer    | null:false                    | 
| price           | string     | null:false                    | 
| user            | references | null:false, foreign_key: true |


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
has_one :address

## addressテーブル

|    Column        |    Type    |          Options             |
|------------------|------------|------------------------------|
| postal_code      | string     | null:false                   |
| prefectures      | integer    | null:false                   |
| municipality     | string     | null:false                   |
| street_number    | string     | null:false                   |
| building_name    | string     |                              |
| telephone_number | string     | null:false                   |
| purchase         | references | null:false, foreign_key: true|


### Association
belongs_to :purchase