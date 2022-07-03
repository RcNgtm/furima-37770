# テーブル設計

## users テーブル
| Column                  | Type    | Options                    |
| ----------------------- | ------- | -------------------------- |
| nickname                | string  | null: false                |
| email                   | string  | null: false, unique: true  |
| encrypted_password      | string  | null: false                |
| last_name               | string  | null: false                |
| first_name              | string  | null: false                |
| last_name_kana          | string  | null: false                |
| first_name_kana         | string  | null: false                |
| birth_date              | date    | null: false                |

### Association
- has_many :items
- has_many :histories


## items テーブル
| Column                   | Type       | Options                        |
| ------------------------ | ---------- | ------------------------------ |
| item_name                | string     | null: false                    |
| items_explain            | text       | null: false                    |
| category_id              | integer    | null: false                    |
| sales_status_id          | integer    | null: false                    |
| shipping_fee_status_id   | integer    | null: false                    |
| prefecture_id            | integer    | null: false                    |
| scheduled_delivery_id    | integer    | null: false                    |
| item_price               | integer    | null: false                    |
| user                     | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :history


## histories テーブル
| Column                   | Type       | Options                        |
| ------------------------ | ---------- | ------------------------------ |
| user                     | references | null: false, foreign_key: true |
| item                     | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :payment


## payments テーブル
| Column                   | Type       | Options                        |
| ------------------------ | ---------- | ------------------------------ |
| postal_code              | string     | null: false                    |
| prefecture_id            | integer    | null: false                    |
| city                     | string     | null: false                    |
| addresses                | string     | null: false                    |
| building                 | string     |                                |
| phone_number             | string     | null: false                    |
| history                  | references | null: false, foreign_key: true |

### Association
- belongs_to :history