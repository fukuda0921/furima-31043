FactoryBot.define do
  factory :item do
    association :user
    name { 'これはカメラです' }
    explanation { 'いい商品です' }
    category_id { 2 }
    status_id { 2 }
    delivery_fee_id { 2 }
    prefecture_id { 36 }
    days_to_ship_id { 2 }
    price { 999 }
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
