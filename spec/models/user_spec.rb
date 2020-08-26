require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it "nickname ~ biethdayまで、すべての項目が存在すれば登録できること" do
      expect(@user).to be_valid
    end

    it "nicknameが空では登録できないこと" do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it "emailが空では登録できないこと" do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it "passwordが空では登録できないこと" do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "passwordが5文字以下であれば登録できないこと" do
      @user.password = "00000"
      @user.password_confirmation = "00000"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

    it "passwordが存在してもpassword_confirmationが空では登録できないこと" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "ユーザー本名の名字が、空では登録できないこと" do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First Name can't be blank")
    end

    it "ユーザー本名の名前が、空では登録できないこと" do
      @user.last_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last Name can't be blank")
    end

    it "ユーザーの名字は全角（漢字・ひらがな・カタカナ）で入力されていないと登録できないこと" do
      @user.first_name = 'aaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("First Name is invalid. Input full-width characters.")
    end

    it "ユーザーの名前は全角（漢字・ひらがな・カタカナ）で入力されていないと登録できないこと" do
      @user.last_name = 'aaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last Name is invalid. Input full-width characters.")
    end

    it "ユーザー本名のフリガナの名字が、空では登録できないこと" do
      @user.first_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First Name Kana can't be blank")
    end

    it "ユーザー本名のフリガナの名前が、空では登録できないこと" do
      @user.last_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last Name Kana can't be blank")
    end

    it "ユーザー本名のフリガナの名字は全角（カタカナ）で入力されていないと登録できないこと" do
      @user.first_name_kana = 'ｱｱｱ'
      @user.valid?
      expect(@user.errors.full_messages).to include("First Name Kana is invalid. Input full-width katakana characters.")
    end

    it "ユーザー本名のフリガナの名前は全角（カタカナ）で入力されていないと登録できないこと" do
      @user.last_name_kana = 'ｱｱｱ'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last Name Kana is invalid. Input full-width katakana characters.")
    end

    it "生年月日を選択していないと登録できないこと" do
      @user.birthday = "0" "0" "0"
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end

  end

end