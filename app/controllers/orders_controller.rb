class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @order = Purchaseform.new
  end

  def create
    @item = Item.find(params[:item_id])
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
