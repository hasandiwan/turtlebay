require 'rails_helper'

RSpec.describe Bid, type: :model do

  let(:bid) { FactoryGirl.create :bid, amount: 6.00 }
  let(:lower_bid) { bid.item.bids.build(amount: 1.00, bidder_id: bid.item.seller_id + 1) }
  let(:seller_bid) { bid.item.bids.build(amount: 7.00, bidder_id: bid.item.seller_id) }
  let(:no_bid) { FactoryGirl.build :bid, amount: nil }

  context "associations" do
    it { expect(subject).to belong_to(:bidder).class_name('User') }
    it { expect(subject).to belong_to :item }
  end

  context "validations" do

    it "should be valid with an amount" do
      new_bid = bid.item.bids.build(amount: 15.00, bidder_id: 4)
      expect(new_bid).to be_valid
    end

    it "should be invalid without an amount" do
      no_bid.valid?
      expect(no_bid.errors.messages).to include(:amount => ["can't be blank"])
    end

    it "should be invalid with a lower bid" do
      expect(lower_bid).to be_invalid
    end

    it "should add an appropriate error message when bid is lower" do
      lower_bid.valid?
      expect(lower_bid.errors[:invalid_bid]).to include("You must bid higher than previous bids.")
    end

    it "should be valid with a higher bid" do
      higher_bid = bid.item.bids.build(amount: 15.00, bidder_id: 4)
      expect(higher_bid).to be_valid
    end

    it "should validate whether a bidder id matches the item's seller id" do
      seller_bid.valid?
      expect(seller_bid).to be_invalid
    end

    it "should add an error message if bidder is the same as seller" do
      seller_bid.valid?
      expect(seller_bid.errors[:invalid_bid]).to include("You cannot bid on your own items.")
    end

  end

end


