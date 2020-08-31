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

has_many : product
belong_to : users

## product テーブル

| Column         | Type       | Options                        |
| -------        | ---------- | ------------------------------ |
| user_id        | integer    | null: false, foreign_key: true |
| picture        | integer    | null: false                    |
| name           | integer    | null: false                    |
| explanation    | integer    | null: false                    |
| size           | integer    | null: false                    |
| category       | integer    | null: false                    |
| cost           | integer    | null: false                    |
| days           | integer    | null: false                    |
| shipping       | integer    | null: false                    |

### Association

has_many : destination
belong_to : users

## destination　テーブル

| Column        　　　 | Type    　| Options                     |
| -------       　　　 | ----------|------------------------- 　 |
| zip-code       　　　| sting 　　 | null: false               　|
| prefectures   　　　 | integer 　 | null: false               　|
| city          　　　 | sting     | null: false                 |
| address        　　　| sting     | null: false                 |
| phone          　　　| string    | null: false                 |

### Association

belongs_to : purchase management　テーブル


##purchase management　テーブル

| Column       　     | Type       | Options                       |
| -------     　      | ---------- | -------------------------     |
| user      　 　     | references  | null: false, FK:true      　　|
| items　    　       | references  | null: false 、FK :true        |
| purchase　management | references | null: false,FK:true           |

