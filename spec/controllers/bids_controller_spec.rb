require 'rails_helper'

describe BidsController do
  let(:seller) { FactoryGirl.create :user }
  let(:bidder) { FactoryGirl.create :user }
  let(:item) { FactoryGirl.create :item, seller: seller }
  let(:bid) { FactoryGirl.create :bid, bidder: bidder, item: item }
  let(:valid_bid_attrs) { FactoryGirl.build(:bid, bidder: bidder, item: item).attributes }
  let(:invalid_bid_attrs) { FactoryGirl.build(:bid, item: item, amount: nil ).attributes }

  before(:each) do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(bidder)
  end

  describe "#new" do
    it "has a 200 status code" do
      get :new, :item => item
      expect(response.status).to eq(200)
    end

    it "renders the new template" do
      get :new, :item => item
      expect(response).to render_template("new")
    end
  end

  describe "#create" do
    context "create bid with valid parameters" do
      subject { post :create, { bid: valid_bid_attrs } }

      it 'creates a bid from valid parameters' do
        expect{subject}.to change{Bid.count}.by(1)
      end

      it 'redirects after creating a bid' do
        subject
        expect(response).to redirect_to item_path(item.id)
      end
    end

    context "create bid with invalid parameters" do
      subject { post :create, { bid: invalid_bid_attrs } }

      it 'does not create a bid with invalid parameters' do
        expect{subject}.not_to change{Bid.count}
      end

      it 'renders new template after recieving an invalid bid' do
        subject
        expect(response).to render_template("new")
      end

      it "should set flash errors" do
        subject
        expect(flash.now[:error]).to eq(["Amount can't be blank"])
      end
    end
  end

end
