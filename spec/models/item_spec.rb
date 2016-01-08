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

  describe "public instance methods" do
    context "responds to public methods" do
      it { expect(subject).to respond_to(:top_bid)}
      it { expect(subject).to respond_to(:open_for_bids)}
    end

    context "#open_for_bids" do
      let(:closed_item){ FactoryGirl.create(:item, start_time: DateTime.now - 5, end_time: DateTime.now - 1)}
      it "returns true for an item open for bidding" do
        expect(item.open_for_bids).to be true
      end
      it "returns false for an closed item" do
        expect(closed_item.open_for_bids).to be false
      end
    end

    context "#top_bid" do
      let!(:item_1) { FactoryGirl.create(:item) }
      let!(:bid_1) { FactoryGirl.create(:bid, item: item_1, amount: 1) }
      let!(:bid_2) { FactoryGirl.create(:bid, item: item_1, amount: 2) }

      it "returns correct bid" do
        expect(item_1.top_bid).to eq(bid_2)
      end
      it "doesn't return incorrect bid" do
        expect(item_1.top_bid).not_to eq(bid_1)
      end
    end
  end

end
