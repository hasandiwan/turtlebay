require 'rails_helper'

RSpec.describe Bid, type: :model do

  before(:each) do
    @item = Item.create()
    @bid = Bid.new(item_id: 1, amount: 0.50, bidder_id:1)
  end

  context "validations" do
    it { should validate_presence_of :amount }
  end

  context "associations" do
    it { should belong_to(:bidder).class_name('User') }
    it { should belong_to :item }
  end

  context "custom validation for bid amount" do
    it "should validate a valid bid amount" do

    end

    it "should add an error message if bid is lower than previous bid" do

    end
  end

  context "custom validation for bidder" do
    it "should validate for a bidder id that does not match the item's seller id" do

    end

    it "should add an error message if bidder is the same as seller" do

    end
  end

end
