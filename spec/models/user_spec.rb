require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録/本人確認" do

    context "新規登録が成功する状況" do

      it "全ての値が存在する場合" do
        expect(@user).to be_valid
      end

    end

    context "新規登録が失敗する状況" do

      it "nicknameが空欄の場合" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end
      it "emailが空欄の場合" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it "重複したemailが存在する場合" do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include "Email has already been taken"
      end
      it "emailは@を含んでない場合" do
        @user.email = "test"
        @user.valid?
        expect(@user.errors.full_messages).to include "Email is invalid"
      end
      it "passwordが空欄の場合" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end
      it "passwordが5文字以下の場合" do
        @user.password = "12345"
        @user.password_confirmation = "12345"
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
      end
      it "passwordは半角英数字混合を使用していない場合" do
        @user.password = "１２３４５６" or "ＡＢＣＤＥＦ"
        @user.valid?
        expect(@user.errors.full_messages).to include "Password Include both letters and numbers"
      end
      it "passwordとpassword_confirmationは値が不一致の場合" do
        @user.password = "123ABCD"
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
      it "last_nameが空欄の場合" do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name can't be blank" 
      end
      it "first_nameが空欄の場合" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "First name can't be blank"
      end
      it "last_nameが、ひらがな・カタカナ・漢字を使用していない場合 " do
      @user.last_name = "test123"
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name Full-width characters"
      end
      it "first_nameが、ひらがな・カタカナ・漢字を使用していない場合" do
        @user.first_name = "test123"
        @user.valid?
        expect(@user.errors.full_messages).to include "First name Full-width characters"
      end
      it "last_name_kanaが空欄の場合" do
        @user.last_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name kana can't be blank" 
      end
      it "first_name_kanaが空欄の場合" do
        @user.first_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana can't be blank"
      end
      it "last_name_kanaが、カタカナを使用していない場合" do
        @user.last_name_kana = "test123田中たろう"
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name kana Full-width katakana characters"
      end
      it "first_name_kanaが、カタカナを使用していない場合" do
        @user.first_name_kana = "test123田中たろう"
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana Full-width katakana characters"
      end
      it "birthdayが空欄の場合" do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Birthday can't be blank"
      end

    end

  end

end