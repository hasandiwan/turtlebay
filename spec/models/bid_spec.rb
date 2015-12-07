require 'rails_helper'

RSpec.describe Bid, type: :model do

  context "validations" do
    it { should validate_presence_of :amount }
  end

  context "associations" do
    it { should belong_to(:bidder).class_name('User') }
    it { should belong_to :item }
  end

end
