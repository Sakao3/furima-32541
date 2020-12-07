class ItemOrder

  # extend ActiveHash::Associations::ActiveRecordExtensions 
  # アクティブハッシュ用に一応記載、アソシエーション用のため、addressに記載しているから多分いらない気がする

  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :block, :building, :telephone_number

  with_options presence: true do
    validates :postal_code,   format: {with: /\A\d{3}[-]\d{4}\z/ }
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :city
    validates :block
    validates :telephone_number, format: { with: /\A[０-９\d]{ ,11}\z/ }, length: { muximum: 11 }
  end

  def save
    item=Item.find(params[:item_id])

    order=Order.create(item_id: item.id, user_id: item.user)

    Address.create(
      postal_code: postal_code, prefecture_id: prefecture_id, city: city, 
      block: block, telephone_number: telephone_number, order_id: order.id
    )
  end
  
end