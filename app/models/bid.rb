class Bid < ActiveRecord::Base
  belongs_to :bidder, class_name: "User"
  belongs_to :item

  validates :amount, presence: true
  validate :greater_than_prev, :seller_is_not_bidder

  def greater_than_prev
    item = Item.find(self.item_id)
    if self.amount < item.bids.last.amount
      errors.add(:invalid_bid, "You must bid higher than previous bids.")
    end
  end

  def seller_is_not_bidder
    item = Item.find(self.item_id)
    if item.seller_id == self.bidder_id
      errors.add(:invalid_bid, "You cannot bid on your own items.")
    end
  end
end
