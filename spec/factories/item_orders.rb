FactoryBot.define do
  factory :item_order do

    postal_code       {"123-4567"}
    prefecture_id     {Faker::Number.between(from: 2, to: 48) }
    city              {Faker::Address.city }
    block             {Faker::Address.street_name}
    building           {"テスト"}
    telephone_number  {"00000000000"}
    token             {"tok_abcdefghijk00000000000000000"}

  end

end