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

has_one :user

## item テーブル

| Column 　　　　　　 |Type        | Options               |
| ------------------|------------|---------------------- |
| user_id           | references | null: false, FK: true |
| zip_code          | string     | null: false           |
| prefecture        | string     | null: false           |
| city              | string     | null: false           |
| address           | string     | null: false           |
| telephone         | string     | null: false           |


### Association

belongs_to :user

## product テーブル

| Column         | Type       | Options                        |
| -------        | ---------- | ------------------------------ |
| name           | integer    | null: false, FK:true           |
| price          | integer    | null: false                    |
| description    | integer    | null: false                    |
| status         | integer    | null: false                    |
| judgment       | integer    | null: false                    |
| size           | integer    | null: false                    |
| cost           | integer    | null: false                    |
| days           | integer    | null: false                    |
| prefecture_id  | integer    | null: false                    |
| category_id    | integer    | null: false                    |
| brand_id       | integer    | null: false                    |
| user_id        | integer    | null: false                    |


### Association

belongs_to :user

## destination　テーブル

| Column         | Type       | Options                        |
| -------        | ---------- | ------------------------------ |
| user_id        | integer    | null: false, FK:true           |
| first_name     | integer    | null: false                    |
| family_name    | integer    | null: false                    |
| zip-code       | integer    | null: false                    |
| prefectures    | integer    | null: false                    |
| address        | integer    | null: false                    |
| phone          | integer    | null: false                    |
| card_number    | integer    | null: false                    |

