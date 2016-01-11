require 'rails_helper'

describe BidPlaceholderHelper do
  let(:bidder) { FactoryGirl.create :user}
  let(:item_top_bid) { FactoryGirl.create :item_with_bids }
  let(:item_starting_bid) { FactoryGirl.create :item, starting_bid: 5.00 }
  let(:item_no_bid) { FactoryGirl.create :item, starting_bid: nil }

  context "#bid_placeholder" do
    it "should return the top bid" do
      item_top_bid.bids.create(amount: 10.00, bidder: bidder)
      expect(bid_placeholder(item_top_bid)).to eq("10.00")
    end

    it "should return the starting bid" do
      expect(bid_placeholder(item_starting_bid)).to eq("5.00")
    end

    it "should return the default value if there are no top bids or starting bids" do
      expect(bid_placeholder(item_no_bid)).to eq("0.00")
    end
  end
end


