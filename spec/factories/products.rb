FactoryBot.define do
  factory :product do
    name { 'sample' }
    explanation { 'example' }

    category { 1 }
    products_status { 5 }
    cost { 2 }
    shipping { 4 }
    day { 3 }
    price { 300 }

    association :user
  end
end
