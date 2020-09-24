class Purchaseform
  include ActiveModel::Model
  attr_accessor :token, :postal_code, :prefecture_id, :city, :addresses, :building, :phone_number, :user_id, :item_id

  with_options presence: true do
    validates :token
    validates :postal_code,  format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :city
    validates :addresses
    validates :phone_number, format: {with: /\A[0-9]+\z/, message: "is invalid"}, length: {maximum: 11, message: "is invalid" }
  end

  def save
    @purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Shipping.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, addresses: addresses, building: building, phone_number: phone_number, purchase_id: @purchase.id)
  end
end