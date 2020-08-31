# テーブル設計

## users テーブル

| Column                    |Type    | Options     |
| --------                  | ------ | ----------- |
| nickname                  | string | null: false |
| family_name               | string | null: false |
| first_name                | string | null: false |
| family_name_kana          | string | null: false |
| first_name_kana           | string | null: false |
| birth_day                 | date   | null: false |
| password                  | string | null: false |
| email                     | string | null: false |


### Association

belongs_to : product
has_many : purchase_management

## product テーブル

| Column         | Type       | Options                        |
| -------        | ---------- | ------------------------------ |
| user_id        | integer    | null: false, foreign_key: true |
| picture        | integer    | null: false                    |
| name           | string     | null: false                    |
| explanation    | text       | null: false                    |
| size           | integer    | null: false                    |
| category       | integer    | null: false                    |
| cost           | integer    | null: false                    |
| price          | integer    | null: false                    |
| days           | integer    | null: false                    |
| shipping       | integer    | null: false                    |

### Association

belongs to : destination
has many : users

## destination　テーブル

| Column        　　　 | Type    　| Options                     |
| -------       　　　 | ----------|------------------------- 　 |
| zip-code       　　　| sting 　　 | null: false               　|
| prefectures   　　　 | integer 　 | null: false               　|
| city          　　　 | sting     | null: false                 |
| address        　　　| sting     | null: false                 |
| building            | sting     |                             |
| phone          　　　| sting     | null: false                 |
| purchase_management  | references  | null: false 、FK :true    |


### Association : purchase_management


belongs_to : purchase_management


##　purchase_management　テーブル

| Column       　     | Type       | Options                       |
| -------     　      | ---------- | -------------------------     |
| user      　 　     | references  | null: false, FK:true      　　|
| item　　    　       | references  | null: false 、FK :true        |

### Association

belongs_to : product