class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  #空の投稿を保存できないようにする
  validates :name, :category, :sales_status, :shipping_fee_status, :prefecture, :scheduled_delivery, presence: true
  
  with_options presence: true do 
    validates :price, format: { with: /\A^[0-9]+^\z/ }
  end

  #プルダウンの選択が「--」の時は保存できないようにする
  validates :category_id, numericality: { other_than: 1 }
  validates :sales_status_id, numericality: { other_than: 1 }
  validates :shipping_fee_status_id, numericality: { other_than: 1 }
  validates :prefecture_id, numericality: { other_than: 1 }
  validates :scheduled_delivery_id, numericality: { other_than: 1 }

  #アソシエーション
  belongs_to :user
  has_one_attached :image
  belongs_to_active_hash :category
  belongs_to_active_hash :sales_status
  belongs_to_active_hash :shipping_fee_status
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :scheduled_delivery
end
