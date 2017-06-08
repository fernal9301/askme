FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@example.ru" }
    sequence(:username) { |n| "vasya_#{n}" }
    password 'qwerty'
  end
end
