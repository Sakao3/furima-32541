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
        expect(@item.errors.full_messages).to include "Userを入力してください"
      end
      it "imageを選択していない場合" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "画像を添付してください"
      end
      it "nameが空欄の場合" do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "商品名を入力してください"
      end
      it "introductionが空欄の場合" do
        @item.introduction = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "商品の紹介を入力してください"
      end
      it "category_id[1]を選択している場合" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "カテゴリーを選択してください"
      end
      it "status_id[1]を選択ている場合" do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "商品の状態を選択してください"
      end
      it "charge_id[1]を選択している場合" do
        @item.charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "配送料の負担を選択してください"
      end
      it "prefecture_id[1]を選択している場合" do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "発送元の地域を選択してください"
      end
      it "term_id[1]を選択している場合" do
        @item.term_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "発送までの日数を選択してください"
      end
      it "priceが空欄の場合" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "価格を入力してください"
      end
      it "priceが半角数字を使用していない場合 " do
        @item.price = "３００"
        @item.valid?
        expect(@item.errors.full_messages).to include "価格は半角での記入をお願いします"
      end
      it "priceの値が「３００」未満の場合" do
        @item.price = Faker::Number.between(from: 0, to: 299)
        @item.valid?
        expect(@item.errors.full_messages).to include "価格の設定範囲を超えております"
      end
      it "priceの値が「9,999,999」を超えている =「８桁」の場合" do
        @item.price = Faker::Number.number(digits: 8)
        @item.valid?
        expect(@item.errors.full_messages).to include "価格の設定範囲を超えております"
      end

    end

  end

end
