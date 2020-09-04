FactoryBot.define do
  factory :item do
    name                { '商品名' }
    info                { '商品の説明' }
    category            { 2 }
    sales_status        { 2 }
    shipping_fee_status { 2 }
    prefecture          { 2 }
    scheduled_delivery  { 2 }
    price               { '300' }
  end
end
