require 'rails_helper'

RSpec.describe Bid, type: :model do

  context "validations" do
    it { should validate_presence_of :amount }
  end

end
