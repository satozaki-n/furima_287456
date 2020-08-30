class ItemsController < ApplicationController
  
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
    params.require(:item).permit(:image, :name, :category_id).merge(user_id: current_user.id)
  end

end
