class User < ActiveRecord::Base
  has_many :items, foreign_key: "seller_id"
  has_many :purchases, class_name: "Item", foreign_key: "buyer_id"
  has_many :bids
end
