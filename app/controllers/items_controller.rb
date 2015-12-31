class ItemsController < ApplicationController

  def index
    @items = Item.available
  end

  def show
    @item = Item.find(params[:id])
    render 'show'
  end

  def new
    @item = Item.new
  end

  def edit
    @item = Item.find(params[:id])
  end

  def create
    @item = Item.new(item_params)
    @item.seller = current_user
    if @item.save
      redirect_to @item
    else
      flash.now[:error] = @item.errors.full_messages
      render 'new'
    end
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to @item
    else
      flash.now[:error] = @item.errors.full_messages
      render 'edit'
    end
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    flash[:notice] = "You have successfully deleted your #{item.title}."
    redirect_to root_path
  end

  def item_params
    params.require(:item).permit(:title, :description, :start_time, :end_time, :starting_bid)
  end

end
