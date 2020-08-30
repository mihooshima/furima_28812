# テーブル設計

## users テーブル

| Column                    |Type    | Options     |
| --------                  | ------ | ----------- |
| nickname                  | string | null: false |
| family_name               | string | null: false |
| first_name                | string | null: false |
| family_name_kana          | string | null: false |
| first_name_kana           | string | null: false |
| birth_day                 | string | null: false |
| password                  | string | null: false |
| email                     | string | null: false |


### Association

belongs_to :user

## item テーブル

| Column 　　　　　　 |Type        | Options               |
| ------------------|------------|---------------------- |
| user_id           | references | null: false, FK: true |
| zip_code          | integer    | null: false           |
| prefecture        | string     | null: false           |
| city              | string     | null: false           |
| address1          | string     | null: false           |
| address2          | string     | null: false           |
| telephone         | string     | null: false           |


### Association

belongs_to :user

## product テーブル

| Column         | Type       | Options                        |
| -------        | ---------- | ------------------------------ |
| name           | text       | null: false, FK:true           |
| price          | text       | null: false                    |
| description    | text       | null: false                    |
| status         | integer    | null: false                    |
| judgment       | integer    | null: false                    |
| size           | integer    | null: false                    |
| cost           | integer    | null: false                    |
| days           | integer    | null: false                    |
| prefecture_id  | integer    | null: false                    |
| category_id    | integer    | null: false                    |
| brand_id       | integer    | null: false                    |
| user_id        | integer    | null: false                    |




