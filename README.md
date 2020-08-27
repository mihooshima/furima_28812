# テーブル設計

## users テーブル

| Column                    |Type    | Options     |
| --------                  | ------ | ----------- |
| nickname                  | string | null: false |
| family_name               | string | null: false |
| first_name                | string | null: false |
| family_name_kana          | string | null: false |
| first_name                | string | null: false |
| birth_day.new             | string | null: false |
| password                  | string | null: false |
| email                     | string | null: false |
| deleted_at                | string | null: false |

### Association

has_many :items
has_many :likes dependent: :destroy
has_many :comments dependent: :destroy
has many :messages dependent: :destroy
has many :points dependent: :destroy
has_many :social_providers dependent: :destroy
has_one  :deliver_addresses dependent: :destroy
has_many :wallets dependent: :destroy
has_many :reviews dependent: :destroy
has_many :orders dependent: :destroy

## social_providersテーブル

| Column      | Type       | Options              |
| ------------| -----------| -------------------- |        | user_id     | references | null: false, FK:true |
| provider    | string     | null: false          |

### Association

belongs_to :user

## deliver_addresses テーブル

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

## wallets テーブル

| Column     | Type       | Options                        |
| -------    | ---------- | ------------------------------ |
| user_id    | references | null:false,FK:true             |
| money      | integer    | null: false                    |


### Association

belongs_to :user

## pointsテーブル

| Column     | Type       | Options                        |
| -------    | ---------- | ------------------------------ |
| user_id    | references | null:false,FK:true             |
| score      | integer    | null: false                    |

### Association

belongs_to :user

## messagesテーブル

| Column     | Type       | Options                        |
| -------    | ---------- | ------------------------------ |
| user_id    | references | null:false,FK:true             |
| item_id    | references | null:false,FK:true             |
| text       | text       | null: false                    |

### Association

belongs_to :user
belongs_to :item

## likeテーブル

| Column     | Type       | Options                        |
| -------    | ---------- | ------------------------------ |
| user_id    | references | null:false,FK:true             |
| item_id    | references | null:false,FK:true             |

### Association

belongs_to :user
belongs_to :item

## reviewsテーブル

| Column     | Type       | Options                        |
| -------    | ---------- | ------------------------------ |
| user_id    | references | null:false,FK:true             |
| item_id    | references | null:false,FK:true             |
| rate       | integer    | null: false                    |
| text       | text       |                                |

### Association

belongs_to :item
belongs_to :user

## ordersテーブル

| Column         | Type           | Options                |
| -------        | -----------    | ---------------------- |
| buyer_user_id  | references     | null:false,FK:true     |
| item_id        | references     | null:false,FK:true     |

### Association

belongs_to :user
belongs_to :item

## itemsテーブル

| Column          | Type           | Options               |
| ---------       | -----------    | --------------------- |
| category_id     | integer        | null: false           |
| shipping_id     | integer        | null: false           |
| brand_id        | integer        | null: false           |
| seller_user_id  | integer        | null: false           |
| name            | string         | null: false           |
| text            | text           | null: false           |
| condition       | integer        | null: false           |
| price           | integer        | null: false           |
| trading_status  | integer        | null: false           |
| completed_at    | datetime       |                       |

### Association

has_many :likes dependent: :destroy
has_many :comments dependent: :destroy
has_many :messages dependent: :destroy
has_one :shipping
has_many :reviews
has_many :item_images dependent: :destroy
has_one :order

## item-imagesテーブル

| Column         | Type           | Options                |
| ----------     | -----------    | -------------------    || item_id        | references     | null:false,FK:true     |
| image_url      | string         | null:false             |

### Association

belongs_to :item

## categoriesテーブル（経路列挙モデル）

| Column         | Type           | Options                |
| ----------     | -----------    | -------------------    |
| path           | text           | null: false            |
| name           | string         | null: false            |
| ancestry       | string         |                        |

### Association

has_many :brands
has_many :items
has_one :category_size
has_one :size, through: :category_size
has_one :category_brand_group
has_one :brand_group, through: :category_brand_group
has_ancestry

## sizesモデル

| Column         | Type           | Options                |
| ----------     | -----------    | -------------------    |
| path           | text           | null: false            |
| kind           | string         | null: false            |
| ancestry       | string         |                        |

### Association

has_many :items
has_many :category_sizes
has_many :categories, through: :category_sizes
has_ancestry

## category_sizesテーブル

| Column         | Type           | Options                |
| ----------     | -----------    | -------------------    |
| category_id    | references     | FK:true                |
| size_id        | references     | FK:true                |

### Association

belongs_to :category
belongs_to :size

## brandsテーブル

| Column         | Type           | Options                |
| ----------     | -----------    | -------------------    |
| category_id    | references     | null: false,FK:true    |
| size_id        | references     | null: false,FK:true    |
| name           | string         | null: false            |

### Association

has_many :item
belongs_to :brand_group
belongs_to :category

## brand-groupsテーブル

| Column         | Type           | Options                |
| ----------     | -----------    | -------------------    |
| name           | string         | null: false            |

### Association

has_many :brands

## shippingsテーブル

| Column         | Type           | Options                |
| ----------     | -----------    | -------------------    |
| fee_burden     | boolean        | null: false            |
| service        | integer        | null: false            |
| area           | integer        | null: false            |
| handling_time  | integer        | null: false            |

### Association

belongs_to :item



