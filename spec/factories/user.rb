FactoryGirl.define do
  factory(:user, aliases: [:seller, :bidder]) do
    sequence(:username) { |n| "Username#{n}" }
    email "john@example.com"
    password "password"
  end
end
