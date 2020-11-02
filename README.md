## users

|     Column      |  Type  |  Options    |
|-----------------|--------|-------------|
| nickname        | string | null: false |
| email           | string | null: false |
| password        | string | null: false |
| last_name       | string | null: false |
| first_name      | string | null: false |
| last_name_kana  | string | null: false |
| first_name_kane | string | null: false |
| birth_date      | date   | null: false |


### Association
has_many :items
has_many :purchases


## items

|      Column     |    Type    |      Options                  |
|-----------------|------------|-------------------------------|
| items_name      | text       | null: false                   |
| explanation     | text       | null: false                   |
| category        | string     | null: false                   |
| status          | string     | null: false                   |
| delivery_fee    | string     | null: false                   |
| delivery_source | string     | null: false                   |
| days_to_ship    | string     | null:false                    | 
| price           | string     | null:false                    | 
| user_id         | references | null:false, foreign_key: true |


### Association
belongs_to :user
has_one :purchase


## purchases

|   Column   |    Type    |          Options              |
|------------|------------|-------------------------------|
| user_id    | references | null:false, foreign_key: true |
| item_id    | references | null:false, foreign_key: true |



### Association
belongs_to :item
has_one :address

## address

|    Column        |    Type    |          Options             |
|------------------|------------|------------------------------|
| postal_code      | string     | null:false                   |
| prefectures      | string     | null:false                   |
| municipality     | string     | null:false                   |
| street_number    | string     | null:false                   |
| building_name    | string     |                              |
| telephone_number | string     | null:false                   |
| purchase_id      | references | null:false, foreign_key: true|


### Association
belongs_to :purchase