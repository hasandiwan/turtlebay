class BidsController < ApplicationController
  def new
    @item = Item.find(params[:item])
    @bid = Bid.new
  end

  def create

  end
end
