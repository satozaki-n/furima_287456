class Userform
  include ActiveModel::ActiveModel
  attr_accessor :nickname, :email, :password, :first_name, :last_name, :first_name_kana, :last_name_kana, :birthday

  validates :nickname, presence: true
  with_options presence: true do
    validates :nickname
    validates :email
    validates :password, format: { with: /\A[a-zA-Z0-9]+\z/ }
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
    validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
    validates :first_name_kana, format: { with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/ }
    validates :last_name_kana, format: { with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/ }
    validates :birthday
  end

  def save
    User.create(with_options)
  end
end
