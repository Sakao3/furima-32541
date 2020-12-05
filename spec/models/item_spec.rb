require 'rails_helper'

RSpec.describe Item, type: :model do

  it "全てが空欄の場合、登録できない" do
    item = Item.new("name"=>"", "introduction"=>"", "category_id"=>"", "status_id"=>"1", "charge_id"=>"1", "prefecture_id"=>"1", "term_id"=>"1", "price"=>"")
    item.valid?
    binding.pry
  end

  # イメージをバリデーションに追加するとこっちでエラー、イメージをバリデーションに追加しないとエラーメッセージが出てこない
  # 画像がついているかどうかのRSpecでの確認方法がまだ不明
end
