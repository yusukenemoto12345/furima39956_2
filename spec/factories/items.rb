FactoryBot.define do
  factory :item do
    name { "Example Item" }
    description { "This is an example item description." }
    price { 500 }
    user_id { 1 }
    condition_id { 2 }
    category_id { 2 }
    shipping_fee_id { 2 }
    prefecture_id { 2 }
    shipping_date_id { 2 }
    item_image { "example.jpg" }
  end
end