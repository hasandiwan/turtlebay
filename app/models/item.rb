class Item < ActiveRecord::Base
  belongs_to :seller, class_name: "User"
  belongs_to :buyer, class_name: "User"
  has_many :bids

  validates :title, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true

  def open_for_bids
    today = DateTime.now
    self.end_time > today ? true : false
  end
end
