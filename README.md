# テーブル設計

## user テーブル

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

has_many : product
belong_to : user

## product テーブル

| Column         | Type       | Options                        |
| -------        | ---------- | ------------------------------ |
| name           | string     | null: false, FK:true           |
| picture        | integer    | null: false                    |
| size           | integer    | null: false                    |
| category       | integer    | null: false                    |
| cost           | integer    | null: false                    |
| days           | integer    | null: false                    |
| shipping       | integer    | null: false                    |

### Association

has_many : destination
belong_to : user

## destination　テーブル

| Column        　　　 | Type    　| Options                      |
| -------       　　　 | ----------|------------------------- 　　 |
| family_name         | string　　 | null: false　　　　　　　　　　 |
| first_name          | string 　　| null: false 　　　　　　　　　　|
| family_name_kana    | string　　 | null: false 　　　　　　　　　　|
| first_name_kana     | string 　　| null: false 　　　　　　　　　 |
| zip-code       　　　| sting 　　 | null: false               　|
| prefectures   　　　 | integer 　 | null: false               　|
| city          　　　 | integer   | null: false                 |
| address        　　　| sting     | null: false                 |
| building_name       | sting     | null:　false                ｜
| phone          　　　| string    | null: false                 |

### Association

has_many: 購入管理テーブル
belong_to : user

##purchase management　テーブル

| Column       　| Type       | Options                       　 |
| -------     　 | ---------- | ------------------------------　 |
| user      　 　| references | null: false, FK:true          　　|
| items_     　 | references  | null: false                   　 |

