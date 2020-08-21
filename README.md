# テーブル設計

## users テーブル

| Column    | Type    | Options     |
| --------- | ------- | ----------- |
| nickname  | string  | null: false |
| email     | string  | null: false |
| password  | string  | null: false |
| birthday  | date    | null: false |

### Association

- has_many :items
- has_many :purchases


## items テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| name      | string     | null: false                    |
| images    | text       | null: false                    |
| category  | string     | null: false                    |
| price     | integer    | null: false                    |
| user      | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- has_one :purchases


## purchases テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- belongs_to :items
- has_one :shipping


## shipping テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| address     | string     | null: false                    |
| card_number | integer    | null: false                    |
| password    | string     | null: false                    |
| purchases   | references | null: false, foreign_key: true |

### Association

- belongs_to :purchases
