FactoryBot.define do
  factory :item do

    name           {"テスト"}
    introduction   {"テストの紹介文"}
    category_id    {Faker::Number.between(from: 2, to: 11) }
    status_id      {Faker::Number.between(from: 2, to: 7) }
    charge_id      {Faker::Number.between(from: 2, to: 3) }
    prefecture_id  {Faker::Number.between(from: 2, to: 48) }
    term_id        {Faker::Number.between(from: 2, to: 4) }
    price          {Faker::Number.between(from: 300, to: 9999999) }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/star.png'), filename: 'star.png')
    end

  end

end

# Faker::Number.betweenの中の値はActiveHashを使用して作成した各モデル記載の値に対応しています。priceは金額の範囲を指定しています