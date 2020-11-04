FactoryBot.define do
  factory :user do
    nickname { Faker::Movies::HarryPotter.character }
    email { Faker::Internet.free_email }
    password { 'aaaaa9' }
    password_confirmation { 'aaaaa9' }
    last_name { '福田' }
    first_name { '光洋' }
    last_name_kana { 'フクダ' }
    first_name_kana { 'ミツヒロ' }
    birth_date { '1996-09-21' }
  end
end
