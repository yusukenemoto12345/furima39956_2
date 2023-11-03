FactoryBot.define do
  factory :item do
    name { "Example Item" }
    condition_id { 1 }
    category_id { 1 }
    shipping_fee_id { 1 }
    prefecture_id { 1 }
    shipping_date_id { 1 }
    price { 500 }
    description { "This is an example item description." }
  end
end