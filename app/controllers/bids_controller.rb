class BidsController < ApplicationController
  def new
    @item = Item.find(params[:item])
    @bid = Bid.new
  end

  def create
    @bid = Bid.new(bid_params)
    @bid.bidder = current_user
    @item = @bid.item
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

end
