class Bid < ActiveRecord::Base
  belongs_to :bidder, class_name: "User"
  belongs_to :item

  validate :greater_than_prev, :seller_is_not_bidder
  validates :amount, presence: true

  scope :top_bid, -> { order(amount: :desc).first }

  def greater_than_prev
    unless self.item.bids.maximum(:amount).nil? || self.amount.nil?
      if self.amount <= self.item.bids.maximum(:amount)
        errors.add(:invalid_bid, "You must bid higher than previous bids.")
      end
    end
  end

  def seller_is_not_bidder
    if self.item.seller == self.bidder
      errors.add(:invalid_bid, "You cannot bid on your own items.")
    end
  end

end
