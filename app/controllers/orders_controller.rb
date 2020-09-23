class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
  end

  def create
    @order = Shipping.new(price: order_params[:id])
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      render orders_path
    end
  end

  private
  def item_params
    params.require(:item).permit(:image, :name, :info, :category_id, :sales_status_id, :shipping_fee_status_id, :prefecture_id, :scheduled_delivery_id, :price).merge(user_id: current_user.id)
  end

  def order_params
    params.permit(:pistalcode, :prefecture_id, :city, :addresses, :building, :phone_number)
  end

  def pay_item
    Payjp.api_key = "sk_test_b6d8402ca02c3529c80a7fde"
    Payjp::Charge.create(
      amount: order_params[:price],  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency:'jpy'
    )
  end

end
