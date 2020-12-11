class ItemOrder

  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :block, :building, :telephone_number, :user_id, :item_id, :token

  validates :token, presence: { message: "を正しく入力してください"}

  with_options presence: true do
    validates :postal_code,   format: {with: /\A\d{3}[-]\d{4}\z/ ,message: "は半角数字のみで間に「-」を入力してください" }
    validates :prefecture_id, numericality: { other_than: 1 ,message: "を選択してください"}
    validates :city
    validates :block
    validates :telephone_number, format: { with: /\A[0-9,０-９]+\z/ ,message: "は数字での入力をお願いします" }, 
                                 length: {maximum: 11 }
    
    validates :user_id
    validates :item_id
  end

  def save

    order=Order.create(item_id: item_id, user_id: user_id)

    Address.create(
      postal_code: postal_code, prefecture_id: prefecture_id, city: city, 
      block: block, building: building,  telephone_number: telephone_number, order_id: order.id
    )
  end

end
