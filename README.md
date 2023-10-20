# README

users 
|Column              |Type    |Options     |
| first_name         |string  |null: false |
| last_name          |string  |null: false |
| first_name_katakana| string |null: false |
| last_name_katakana | string |null: false |
| nickname           | string |null: false |
| email              |string  |unique: true, null: false|
| encrypted_password |string  |null: false |
| date_of_birth      |integer |null: false |

items
|Column       |Type       |Options|
|name         |string     |null: false |
|price        |integer    |null: false |
|user         |references |null: false ,foreign_key: true|
|description  |text       |null: false|
|condition_id |string     |null: false|


orders 
|Column     |Type      |Options|
|user_id    |string    |null: false|
|product_id |string    |foreign_key: true,null: false |


shipping address
|Column      |Type   |Options|
|postal_code |string |null: false|
|address     |string |null: false|

purchases
| Column     | Type    | Options                    |
| user_id    | integer | foreign_key: true, null: false |
| product_id | integer | foreign_key: true, null: false |
| quantity   | integer | null: false                |
| order_date | datetime| null: false                | 