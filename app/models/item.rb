class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  #空の投稿を保存できないようにする
  validates :name, :category, :sales_status, presence: true

  #カテゴリーの選択が「--」の時は保存できないようにする
  validates :category_id, numericality: { other_than: 1 }
  validates :sales_status_id, numericality: { other_than: 1 }

  #アソシエーション
  belongs_to :user
  has_one_attached :image
  belongs_to_active_hash :category
  belongs_to_active_hash :sales_status

end
