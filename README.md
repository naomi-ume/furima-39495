# README
------------------------------------------------------------
# furima-39495
------------------------------------------------------------

# テーブル設計
------------------------------------------------------------
## usersテーブル

| Column             | Type       | Options                 |
| ------------------ | ---------- | ------------------------|
| nickname           | string     | null: false,unique:true |
| email              | string     | null: false,unique:true |
| encrypted_password | string     | null: false,unique:true |
| last_name          | string     | null: false             |
| first_name         | string     | null: false             |
| last_name_kana     | string     | null: false             |
| first_name_kana    | string     | null: false             |
| birthday           | date       | null: false             |
### Association
- has_many :items
- has_many :orders
- has_many :comments
------------------------------------------------------------

## itemsテーブル

| Column          | Type       | Options                        |
| --------------  | ---------- | ------------------------------ |
| user            | references | null: false, foreign_key: true |
| item_name       | string     | null: false                    |
| image           | image      | null: false                    |
| description     | text       | null: false                    |
| category_id     | integer    | null: false                    |
| item_status_id  | integer    | null: false                    |
| shipping_cost_id| integer    | null: false                    |
| prefecture_id   | integer    | null: false                    |
| shipping_date_id| integer    | null: false                    |
| price           | integer    | null: false                    |
### Association
- belongs_to :user
- has_one :order
- has_many :comments
--------------------------------------------------------

## ordersテーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :delivery_detail

--------------------------------------------------------

## delivery_detailsテーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| orders        | references | null: false, foreign_key: true |
| postcode      | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| block         | string     | null: false                    |
| building      | string     |                                |
| phone_number  | string     | null: false                    |
### Association
- belongs_to :order

--------------------------------------------------------
## commentsテーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |
| text   | text       | null: false                    |

### Association
- belongs_to :user
- belongs_to :item

--------------------------------------------------------
* Database creation
- develope environment :mySQL 
- test environment : mySQL
- product environment : postgreSQL

* Ruby version
- ruby 3.2.0 (2022-12-25 revision)