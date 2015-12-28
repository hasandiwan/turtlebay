class ItemsController < ApplicationController

  def index
  end

  def show
    @item = Item.find(params[:id])
    render 'show'
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(user_params)
      redirect_to @item
    else
      flash.now[:error] = @item.errors.full_messages
      render 'edit'
    end
  end

  def user_params
    params.require(:item).permit(:title, :description, :start_time, :end_time, :starting_bid)
  end

end
