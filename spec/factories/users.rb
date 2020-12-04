FactoryBot.define do
  factory :user do
    nickname               {"たなか"}
    email                  {Faker::Internet.email}
    password               {"123ABC"}
    password_confirmation  {password}
    last_name              {"田中"}
    first_name             {"太郎"}
    last_name_kana         {"タナカ"}
    first_name_kana        {"タロウ"}
    birthday               {"2000-01-01"}
  end
end