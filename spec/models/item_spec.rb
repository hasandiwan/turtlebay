require 'rails_helper'

RSpec.describe Item, type: :model do

  let(:item) { FactoryGirl.create :item }

  context "validations" do
    it { expect(item).to validate_presence_of :title }
    it { expect(item).to validate_presence_of :start_time }
    it { expect(item).to validate_presence_of :end_time }
  end

  context "associations" do
    it { expect(subject).to belong_to(:seller).class_name('User') }
    it { expect(subject).to belong_to(:buyer).class_name('User') }
    it { expect(subject).to have_many :bids }
  end

  describe "#open_for_bids" do
    let(:closed_item){ FactoryGirl.create(:item, start_time: DateTime.now - 5, end_time: DateTime.now - 1)}
    it "returns true for an item open for bidding" do
      expect(item.open_for_bids).to be true
    end
    it "returns false for an closed item" do
      expect(closed_item.open_for_bids).to be false
    end
  end

end
