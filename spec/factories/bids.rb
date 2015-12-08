FactoryGirl.define do
  factory :bid do
    association :bidder, factory: :user
    association :item, factory: :item
    amount rand(1.00..5.00)
  end
end