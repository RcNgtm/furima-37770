# テーブル設計

## users テーブル
| Column                  | Type    | Options                    |
| ----------------------- | ------- | -------------------------- |
| nickname                | string  | null: false                |
| email                   | string  | null: false, unique: true  |
| password                | string  | null: false                |
| password_confirmation   | string  | null: false                |
| last-name               | string  | null: false                |
| first-name              | string  | null: false                |
| last-name-kana          | string  | null: false                |
| first-name-kana         | string  | null: false                |
| user-birth-date-1i      | integer | null: false                |
| user-birth-date-2i      | integer | null: false                |
| user-birth-date-3i      | integer | null: false                |

### Association
- has_many :items
- has_many :payments

## items テーブル
| Column                   | Type       | Options                        |
| ------------------------ | ---------- | ------------------------------ |
| item-name                | string     | null: false                    |
| items-explain            | text       | null: false                    |
| item-category            | string     | null: false                    |
| item-sales-status        | string     | null: false                    |
| item-shipping-fee-status | string     | null: false                    |
| item-prefecture          | string     | null: false                    |
| item-scheduled-delivery  | string     | null: false                    |
| item-price               | integer    | null: false                    |
| user                     | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :payment

## payments テーブル
| Column                   | Type       | Options                        |
| ------------------------ | ---------- | ------------------------------ |
| card-number              | integer    | null: false                    |
| card-exp-month           | integer    | null: false                    |
| card-exp-year            | integer    | null: false                    |
| card-cvc                 | integer    | null: false                    |
| postal_code              | integer    | null: false                    |
| Prefectures              | string     | null: false                    |
| city                     | string     | null: false                    |
| addresses                | string     | null: false                    |
| building                 | string     |                                |
| phone-number             | integer    | null: false                    |
| item                     | references | null: false, foreign_key: true |

### Association
- belongs_to :items
- has_many :users