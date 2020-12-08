require 'rails_helper'

RSpec.describe ItemOrder, type: :model do
  before do
    @item_order = FactoryBot.build(:item_order)
  end
  
  describe "商品購入機能" do
    
    context "購入が成功する状況" do
      it "全ての値が存在する場合" do
        expect(@item_order).to be_valid
      end
      it "buildingだけ記入していない場合" do
        @item_order.building = nil
        expect(@item_order).to be_valid
      end
    end

    context "購入が失敗する状況" do
      it "postal_codeが空欄の場合" do
        @item_order.postal_code = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include "Postal code can't be blank"
      end
      it "postal_codeに「-」を使用していない場合" do
        @item_order.postal_code = 0000000
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include "Postal code Input correctly"
      end
      it "prefecture_id[1]を選択している場合" do
        @item_order.prefecture_id = 1
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include "Prefecture Select"
      end
      it "cityが空欄の場合" do
        @item_order.city = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include "City can't be blank"
      end
      it "blockが空欄の場合" do
        @item_order.block = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include "Block can't be blank"
      end
      it "telephone_numberが空欄の場合" do
        @item_order.telephone_number = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include "Telephone number can't be blank"
      end
      it "telephone_numberが数字以外を使用している場合" do
        @item_order.telephone_number = "テストtestTEST"
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include "Telephone number Input only number"
      end
      it "telephone_numberが11文字以上の場合" do
        @item_order.telephone_number = "000000000000"
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include "Telephone number is too long (maximum is 11 characters)"
      end
      it "カード情報が全て埋まっていない場合＝Tokenが取得できない場合" do
        @item_order.token = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include "Token can't be blank"
      end
    end

  end
  
end