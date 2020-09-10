FactoryBot.define do
  factory :product do
    association :user
    name { 'sample' }
    explanation { 'example' }
    category_id { 2 }
    products_status_id{ 5 }
    shipping_cost_id{ 2 }
    shipping_id{ 4 }
    day_id{ 3 }
    price { 300 }
    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/camera.png'), filename: 'test_image.png',content_type:'image/png')
    end
  end
end
