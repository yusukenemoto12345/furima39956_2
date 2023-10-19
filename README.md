# README

User 
|Column   |Type    |Options|
|id	      |string  |foreign_key: true, unique: true |
|username |string  |null: false|
|email    |string  |null: false|
|password |string  |null: false|


item
|Column   |Type   |Options|
|id       |string |foreign_key: true, unique: true|
|name     |string |null: false |
|price    |string |null: false |
|seller_id|string|null: false ,foreign_key: true|


Order 
|Column     |Type      |Options|
|id         |sting     | foreign_key: true, unique: true|
|user_id    |sting     | foreign_key: true, null: false|
|product_id |sting     | foreign_key: true,null: false |
|quantity   |sting     |null: false  |
|order_date |references|null: false  |



