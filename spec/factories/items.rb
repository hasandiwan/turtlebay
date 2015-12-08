FactoryGirl.define do
  factory :item do
    association :seller, factory: :user
    title Faker::Book.title
    description Faker::Lorem.paragraphs
    start_time Faker::Time.between(DateTime.now - 3, DateTime.now)
    end_time Faker::Time.forward(14, :evening)
  end
end