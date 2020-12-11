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
        expect(@user.errors.full_messages).to include "ニックネームを入力してください"
      end
      it "emailが空欄の場合" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "メールアドレスを入力してください"
      end
      it "重複したemailが存在する場合" do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include "メールアドレスはすでに存在します"
      end
      it "emailは@を含んでない場合" do
        @user.email = "test"
        @user.valid?
        expect(@user.errors.full_messages).to include "メールアドレスは不正な値です"
      end
      it "passwordが空欄の場合" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "パスワードを入力してください"
      end
      it "passwordが5文字以下の場合" do
        @user.password = "12345"
        @user.password_confirmation = "12345"
        @user.valid?
        expect(@user.errors.full_messages).to include "パスワードは6文字以上で入力してください"
      end
      it "passwordは半角英数字混合を使用していない場合（全角数字のみ）" do
        @user.password = "１２３４５６"
        @user.valid?
        expect(@user.errors.full_messages).to include "パスワードは英語と数字を混同させてください"
      end
      it "passwordは半角英数字混合を使用していない場合（全角英語のみ）" do
        @user.password = "ＡＢＣＤＥＦ"
        @user.valid?
        expect(@user.errors.full_messages).to include "パスワードは英語と数字を混同させてください"
      end
      it "passwordとpassword_confirmationは値が不一致の場合" do
        @user.password = "123ABCD"
        @user.valid?
        expect(@user.errors.full_messages).to include "パスワード（確認用）とパスワードの入力が一致しません"
      end
      it "last_nameが空欄の場合" do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "お名前を入力してください" 
      end
      it "first_nameが空欄の場合" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "苗字を入力してください"
      end
      it "last_nameが、ひらがな・カタカナ・漢字を使用していない場合 " do
      @user.last_name = "test123"
      @user.valid?
      expect(@user.errors.full_messages).to include "お名前は全て全角での入力をお願いします"
      end
      it "first_nameが、ひらがな・カタカナ・漢字を使用していない場合" do
        @user.first_name = "test123"
        @user.valid?
        expect(@user.errors.full_messages).to include "苗字は全て全角での入力をお願いします"
      end
      it "last_name_kanaが空欄の場合" do
        @user.last_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "お名前(カナ)を入力してください" 
      end
      it "first_name_kanaが空欄の場合" do
        @user.first_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "苗字(カナ)を入力してください"
      end
      it "last_name_kanaが、カタカナを使用していない場合" do
        @user.last_name_kana = "test123田中たろう"
        @user.valid?
        expect(@user.errors.full_messages).to include "お名前(カナ)はカタカナでの入力をお願いします"
      end
      it "first_name_kanaが、カタカナを使用していない場合" do
        @user.first_name_kana = "test123田中たろう"
        @user.valid?
        expect(@user.errors.full_messages).to include "苗字(カナ)はカタカナでの入力をお願いします"
      end
      it "birthdayが空欄の場合" do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "生年月日を入力してください"
      end

    end

  end

end