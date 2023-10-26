FactoryBot.define do
  factory :user do
    sequence(:nickname) { |n| "test#{n}" }
    sequence(:email) { |n| "#{n}_#{Faker::Internet.unique.email}" }
    password { 'password123' }
    password_confirmation { 'password123' }
    first_name { '太郎' }
    last_name { '田中' }
    first_name_katakana { 'タロウ' }
    last_name_katakana { 'タナカ' }
    birth_date { Date.new(2000, 1, 1) }
  end
end