# README

users 
|Column     |Type    |Options    |
| first_name|string  |null: false|
| last_name |string  |null: false|
| email     |string  |unique: true, null: false|
| encrypted_password|string  |null: false|


items
|Column      |Type    |Options|
|name        |string  |null: false |
|price       |decimal |null: false |
|user_id     |bigint  |null: false ,foreign_key: true|
|description |text    |null: false|
|condition   |string  |null: false|


orders 
|Column     |Type      |Options|
|user_id    |sting     |  null: false|
|product_id |sting     | foreign_key: true,null: false |
|quantity   |sting     |null: false  |
|order_date |references|null: false  |


ShippingAddress
|Column      |Type  |Options|
|ser_id      |bigint|foreign_key: true, null: false|
|name        |sting |not null|
|postal_code |sting |not null|
|address     |text  |not null|

