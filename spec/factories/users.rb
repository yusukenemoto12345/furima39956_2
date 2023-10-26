FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email { Faker::Internet.unique.email }
    password              {'000000'}
    password_confirmation {password}
  end
end