class Item < ActiveRecord::Base
  belongs_to :seller, class_name: "User"
  belongs_to :buyer, class_name: "User"
  has_many :bids

  validates :title, presence: true
  validates :description, presence: true
  validates :start, presence: true
  validates :end, presence: true
end
