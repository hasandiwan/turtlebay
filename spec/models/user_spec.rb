require 'rails_helper'

RSpec.describe User, type: :model do

  context "validations" do
    it { expect(subject).to validate_presence_of :username }
    it { expect(subject).to validate_presence_of :email }
    it { expect(subject).to validate_presence_of :password }
    it { expect(subject).to have_secure_password }
  end

  context "associations" do
    it { expect(subject).to have_many(:items).with_foreign_key('seller_id') }
    it {
      expect(subject).to have_many(:purchases)
        .class_name('Item')
        .with_foreign_key('buyer_id')
    }
    it { expect(subject).to have_many(:bids).with_foreign_key('bidder_id') }
  end

  describe "public instance methods" do
    context "responds to public methods" do
      it { expect(subject).to respond_to(:bid_items)}
    end

    context "#bid_items" do
      let!(:user_1) { FactoryGirl.create(:user) }
      let!(:item_1) { FactoryGirl.create(:item) }
      let!(:item_2) { FactoryGirl.create(:item) }
      let!(:bid_1) { FactoryGirl.create(:bid, bidder: user_1, item: item_1) }
      let!(:bid_2) { FactoryGirl.create(:bid, item: item_2) }

      it "returns correct items" do
        expect(user_1.bid_items).to include(item_1)
      end
      it "doesn't return incorrect items" do
        expect(user_1.bid_items).not_to include(item_2)
      end
    end
  end

end
