require 'rails_helper'

RSpec.describe User, type: :model do

  context "validations" do
    it { should validate_presence_of :username }
    it { should validate_presence_of :email }
    it { should validate_presence_of :password }
    it { should have_secure_password }
  end

  context "associations" do
    it { should have_many(:items).with_foreign_key('seller_id') }
    it {
      should have_many(:purchases)
        .class_name('Item')
        .with_foreign_key('buyer_id')
    }
    it { should have_many(:bids).with_foreign_key('bidder_id') }
  end

end
