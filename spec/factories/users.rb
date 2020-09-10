FactoryBot.define do
  factory :user do
    nickname              { 'abe' }
    email                 { 'kkk@gmail.com' }
    password              { '00000000' }
    password_confirmation { 'password' }
    first_name            { '山田' }
    family_name           { '太郎' }
    fist_name_kana        { 'ヤマダ' }
    family_name_kana      { 'タロウ' }
  end
end
