FactoryBot.define do
  factory :purchese_management_address do
    zip_code { '812-0011' }
    shipping_area { 40 }
    city { '福岡市博多区' }
    address { '博多駅前1丁目21-20' }
    phone { '09012345678' }
    token { 'qwerytsdfcvbh' }
  end
end