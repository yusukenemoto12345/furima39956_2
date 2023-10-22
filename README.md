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
| date_of_birth      |date    |null: false |

## Association
has_many :items
has_many :orders

items
|Column           |Type       |Options|
|name             |string     |null: false |
|price            |integer    |null: false |
|user             |references |null: false ,foreign_key: true|
|description      |text       |null: false |
|condition_id     |integer    |null: false |
|category_id      |integer    |null: false |
|shipping_fee_id  |integer    |null: false |
|prefecture_id    |integer    |null: false |
|shipping_date_id |integer    |null: false |

## Association
belongs_to :user
has_one :order


orders 
|Column              |Type       |Options|
|user                |references |null: false ,foreign_key: true|
|shipping_address_id |integer    |foreign_key: true |

## Association
belongs_to :user
belongs_to :product, class_name: "Item"


shipping_addresses
|Column        |Type       |Options|
|postal_code   |string     |null: false|
|address       |string     |null: false|
|prefecture_id |integer    |null: false|
|city          |string     |null: false|
|building_name |string     |           |
|phone_number  |string     |null: false|
|user          |references |null: false|
|order         |references |null: false ,foreign_key: true|

belongs_to :order
Share
Save







