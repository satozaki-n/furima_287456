class OrdersController < ApplicationController

  before_action :item_set, only[:index, :create]
  before_action :move_to_index, expect: [:index, :create]

  def index
    @order = Purchaseform.new
  end

  def create
    @order = Purchaseform.new(order_params)
    
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      render :index
    end
  end

  private
  def item_set
    @item = Item.find(params[:item_id])
  end

  def move_to_index
    unless user_signed_in?
      redirect_to new_user_registration_path
    end
  end

  def order_params
    params.permit(:postal_code, :prefecture_id, :city, :addresses, :building, :phone_number, :item_id, :token).merge(user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = "sk_test_b6d8402ca02c3529c80a7fde"
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency:'jpy'
    )
  end

end
