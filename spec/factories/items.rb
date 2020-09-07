FactoryBot.define do
  factory :item do
    name                { Faker::Name }
    info                { Faker::Lorem.sentence }
    category            { 2 }
    sales_status        { '2' }
    shipping_fee_status { '2' }
    prefecture          { '2' }
    scheduled_delivery  { '2' }
    price               { '500' }
    association :user
    association :category
    association :sales_status
    association :shipping_fee_status
    association :prefecture
    association :scheduled_delivery
    
  end
end
