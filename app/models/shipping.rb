class Shipping < ApplicationRecord
  belongs_to :purcases
  with_options presence: true do 
    validates :postal_code
    validates :prefecture_id
    validates :city
    validates :addresses
    validates :phone_number
  end
end
