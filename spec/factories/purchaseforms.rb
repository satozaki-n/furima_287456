FactoryBot.define do
  factory :purchaseform do
    token           { 'aaa' }
    postal_code     { '123-4567' }
    prefecture_id   { '2' }
    city            { '横浜市横浜' }
    addresses       { '番地' }
    phone_number    { '12345678910' }
    association :user
    association :item
  end
end
