class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @order = Shipping.new
  end

  def create
    @order = Shipping.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index
    end
  end

  private
  def item_params
    params.require(:item).permit(:image, :name, :info, :category_id, :sales_status_id, :shipping_fee_status_id, :prefecture_id, :scheduled_delivery_id, :price).merge(user_id: current_user.id)
  end

  def order_params
    params.require(:shipping).permit(:taken, :postal_code, :prefecture_id, :city, :addresses, :building, :phone_number)
  end

  def pay_item
    Payjp.api_key = "sk_test_b6d8402ca02c3529c80a7fde"
    Payjp::Charge.create(
      amount: item_params[:price],
      card: order_params[:token],
      currency:'jpy'
    )
  end

end
