require 'rails_helper'

RSpec.describe Item, type: :model do

  it "全てが空欄の場合、登録できない" do
    item = Item.new("image"=>"","name"=>"", "introduction"=>"", "category_id"=>"", "status_id"=>"1", "charge_id"=>"1", "prefecture_id"=>"1", "term_id"=>"1", "price"=>"")
    item.valid?
  end

end
