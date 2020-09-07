class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
        
    with_options presence: true do
      validates :nickname
      validates :email
      validates :birthday
    end

    validates :password, presence: true, format: { with: /\A[a-zA-Z0-9]+\z/ }

    with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/} do
      validates :first_name
      validates :last_name
    end

    with_options presence: true, format: { with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/ } do
      validates :first_name_kana
      validates :last_name_kana
    end

    has_many :items
end
