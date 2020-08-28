# テーブル設計

## users テーブル

| Column                    |Type    | Options     |
| --------                  | ------ | ----------- |
| nickname                  | string | null: false |
| family_name               | string | null: false |
| first_name                | string | null: false |
| family_name_kana          | string | null: false |
| first_name_kana           | string | null: false |
| birth_day.new             | string | null: false |
| password                  | string | null: false |
| email                     | string | null: false |

### Association

- belongs_to :card_users

## card テーブル

| Column                    |Type    | Options     |
| --------                  | ------ | ----------- |
| user_id                   | string | null: false |
| customer_id    　          | string | null: false |
| card_id                   | string | null: false |

### Association

belongs_to :user

## destination テーブル

| Column 　　　　　　 |Type        | Options               |
| ------------------|------------|---------------------- |
| user_id           | references | null: false, FK: true |
| family_name       | string     | null: false           |
| family_name_kana  | string     | null: false           |
| first_name_kana   | string     | null: false           |
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
| name           | references | null:false,FK:true             |
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

belongs_to :use

## image テーブル

| Column         | Type       | Options                        |
| -------        | ---------- | ------------------------------ |
| images         | reference  | null: false , FK:true          |
| product_id     | integer    | null: false                    |
| purchase_id    | integer    | null: false                    |

### Association

belongs_to :use

## category テーブル

| Column         | Type       | Options                        |
| -------        | ---------- | ------------------------------ |
| name           | reference  | null: false , FK:true          |
| ancestry       | integer    | null: false                    |

### Association

has_one

| Column         | Type       | Options                        |
| -------        | ---------- | ------------------------------ |
| brand          |            |                                |  
| name           |            |                                |