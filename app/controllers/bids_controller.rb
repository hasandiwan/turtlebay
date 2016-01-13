class BidsController < ApplicationController
  before_action :find_item, only: [:new, :create]

  def new
    @bid = Bid.new
  end

  def create
    @bid = Bid.new(bid_params)
    @bid.bidder = current_user
    if @bid.save
      redirect_to @item
    else
      flash.now[:error] = @bid.errors.full_messages
      render 'new'
    end
  end

  private

  def bid_params
    params.require(:bid).permit(:amount, :bidder_id, :item_id)
  end

  def find_item
    @item = Item.find(params[:item_id])
  end

end
