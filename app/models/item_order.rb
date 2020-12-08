class ItemOrder

  # extend ActiveHash::Associations::ActiveRecordExtensions 
  # アクティブハッシュ用に一応記載、アソシエーション用のため、addressに記載しているから多分いらない気がする

  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :block, :building, :telephone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :postal_code,   format: {with: /\A\d{3}[-]\d{4}\z/ ,message: "Input correctly" }
    validates :prefecture_id, numericality: { other_than: 1 ,message: "Select"}
    validates :city
    validates :block
    validates :telephone_number, format: { with: /\A[0-9,０-９]+\z/ ,message: "Input only number" }, 
                                 length: {maximum: 11 }

    validates :token
    
  end

  def save

    order=Order.create(item_id: item_id, user_id: user_id)

    Address.create(
      postal_code: postal_code, prefecture_id: prefecture_id, city: city, 
      block: block, building: building,  telephone_number: telephone_number, order_id: order.id
    )
  end

end
