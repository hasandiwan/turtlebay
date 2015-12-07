require 'rails_helper'

RSpec.describe Item, type: :model do

  context "validations" do
    it { should validate_presence_of :title }
    it { should validate_presence_of :description }
    it { should validate_presence_of :start }
    it { should validate_presence_of :end }
  end

  context "associations" do
    it { should belong_to(:seller).class_name('User') }
    it { should belong_to(:buyer).class_name('User') }
    it { should have_many :bids }
  end

end
