class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  #空の投稿を保存できないようにする
  with_options presence: true do
    validates :name
    validates :category
    validates :sales_status
    validates :shipping_fee_status
    validates :prefecture
    validates :scheduled_delivery
    validates :price, format: { with: /\A^[0-9]+^\z/, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  end

  #プルダウンの選択が「--」の時は保存できないようにする
  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :sales_status_id
    validates :shipping_fee_status_id
    validates :prefecture_id
    validates :scheduled_delivery_id
  end

  #アソシエーション
  belongs_to :user
  has_one_attached :image
  belongs_to_active_hash :category
  belongs_to_active_hash :sales_status
  belongs_to_active_hash :shipping_fee_status
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :scheduled_delivery
end
