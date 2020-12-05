require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe "商品出機能" do

    context "出品が成功する状況" do

      it "全ての値が存在する場合" do
        expect(@item).to be_valid
      end

    end

    context "出品が失敗する状況" do
      it "Userが存在していない場合" do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "User must exist"
      end

      it "imageを選択していない場合" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
      it "nameが空欄の場合" do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Name can't be blank"
      end
      it "introductionが空欄の場合" do
        @item.introduction = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Introduction can't be blank"
      end
      it "category_id[1]を選択している場合" do
        @item.category_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include "Category Select"
      end
      it "status_id[1]を選択ている場合" do
        @item.status_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include "Status Select"
      end
      it "charge_id[1]を選択している場合" do
        @item.charge_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include "Charge Select"
      end
      it "prefecture_id[1]を選択している場合" do
        @item.prefecture_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include "Prefecture Select"
      end
      it "term_id[1]を選択している場合" do
        @item.term_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include "Term Select"
      end
      it "priceが空欄の場合" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end
      it "priceが半角数字を使用していない場合 " do
        @item.price = "３００"
        @item.valid?
        expect(@item.errors.full_messages).to include "Price Half-width number"
      end
      it "priceの値が「３００」未満の場合" do
        @item.price = Faker::Number.between(from: 0, to: 299)
        @item.valid?
        expect(@item.errors.full_messages).to include "Price Out of setting range"
      end
      it "priceの値が「9,999,999」を超えてい =「８桁」の場合" do
        @item.price = Faker::Number.number(digits: 8)
        @item.valid?
        expect(@item.errors.full_messages).to include "Price Out of setting range"
      end

    end

  end

end

