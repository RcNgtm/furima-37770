FactoryBot.define do
  factory :user do
    name = Gimei.name
    nickname    { Faker::Name.name }
    email       { Faker::Internet.free_email }
    password    { Faker::Lorem.characters(number: 6, min_alpha: 1, min_numeric: 1) }
    password_confirmation { password }
    birth_date  { Faker::Date.birthday }
    first_name  { name.first.kanji }
    last_name   { name.last.kanji }
    last_name_kana  { name.last.katakana }
    first_name_kana { name.first.katakana }
  end
end
