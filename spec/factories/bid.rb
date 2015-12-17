FactoryGirl.define do
  factory :bid do
    association :bidder, factory: :user
    association :item, factory: :item
    amount 5.00
  end
end
