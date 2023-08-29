FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials }
    email                 { Faker::Internet.free_email }
    password              { 'Abc123' }
    password_confirmation { 'Abc123' }
    last_name             { '岸田' }
    first_name            { '文雄' }
    last_name_kana        { 'キシダ' }
    first_name_kana       { 'フミオ' }
    birthday              { '1957/07/29' }
  end
end
