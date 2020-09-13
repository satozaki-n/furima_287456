class ItemsController < ApplicationController
  before_action :show_item, only: [:show]

  def index
    @items = Item.all
  end

  def new
    @items = Item.new
  end

  def create
    @items = Item.new(item_params)
      if @items.save
        redirect_to root_path
      else
        render :new
      end
  end

  def show
    @user = current_user.user
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :info, :category_id, :sales_status_id, :shipping_fee_status_id, :prefecture_id, :scheduled_delivery_id, :price).merge(user_id: current_user.id)
  end

  def show_item
    @item = Item.find(params[:id])
  end

end
