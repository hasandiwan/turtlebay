class Item < ActiveRecord::Base
  belongs_to :seller, class_name: "User"
  belongs_to :buyer, class_name: "User"
  has_many :bids

  validates :title, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true

  validate :end_greater_than_start

  def end_greater_than_start
    unless self.end_time.nil? || self.start_time.nil?
      if self.end_time < self.start_time
        errors.add(:end_time, "item must end after the start time")
      end
    end
  end

  def open_for_bids
    today = DateTime.now
    self.end_time > today ? true : false
  end

  def self.available
    self.where('items.start_time <= now() AND items.end_time >= now()').order(:title)
  end

  def self.scheduled
    self.where('items.start_time > now()').order(:title)
  end

  def self.expired
    self.where('items.end_time < now()').order(:title)
  end

end
