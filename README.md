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

has_many : item
belong_to : user

## item テーブル

| Column 　　　　　　 |Type        | Options               |
| ------------------|------------|---------------------- |
| user_id           | integer    | null: false, FK: true |
| zip_code          | string     | null: false           |
| prefecture        | string     | null: false           |
| city              | string     | null: false           |
| address           | string     | null: false           |
| telephone         | string     | null: false           |


### Association

has_many : product
belong_to : user

## product テーブル

| Column         | Type       | Options                        |
| -------        | ---------- | ------------------------------ |
| name           | string     | null: false, FK:true           |
| size           | integer    | null: false                    |
| cost           | integer    | null: false                    |
| days           | integer    | null: false                    |
| prefecture_id  | integer    | null: false                    |
| category_id    | integer    | null: false                    |
| user_id        | integer    | null: false                    |


### Association

has_many : destination
belong_to : user

## destination　テーブル

| Column         | Type       | Options                        |
| -------        | ---------- | ------------------------------ |
| zip-code       | sting      | null: false                    |
| prefectures    | integer    | null: false                    |
| city           | integer    | null: false                    |
| address        | sting      | null: false                    |
| phone          | string     | null: false                    |

### Association

has_many: 購入管理テーブル
belong_to : user

##購入管理　テーブル

| Column         | Type       | Options                        |
| -------        | ---------- | ------------------------------ |
| user_id        | string     | null: false, FK:true           |
| items_id       | integer    | null: false                    |
| price          | integer    | null: false                    |
| description    | integer    | null: false                    |
| status         | integer    | null: false                    |
| judgment       | integer    | null: false                    |
