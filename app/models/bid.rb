class Bid < ActiveRecord::Base
  belongs_to :bidder, class_name: "User"
  belongs_to :item

  validates :amount, presence: true
end
