class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  #空の投稿を保存できないようにする
  validates :name, :category, presence: true

  #カテゴリーの選択が「--」の時は保存できないようにする
  validates :category_id, numericality: { other_than: 1 }

  #アソシエーション
  belongs_to :user
  has_one_attached :image

end
