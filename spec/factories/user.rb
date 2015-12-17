FactoryGirl.define do
  factory :user do
    sequence(:username) { |n| "Username#{n}" }
    email "john@example.com"
    password "password"
  end
end