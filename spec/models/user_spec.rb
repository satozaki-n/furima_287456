require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context 'ユーザー情報' do
      it 'nickname ~ biethdayまで、すべての項目が存在すれば登録できること' do
        expect(@user).to be_valid
      end

      it 'nicknameが空では登録できないこと' do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'emailが空では登録できないこと' do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'passwordが空では登録できないこと' do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordが5文字以下であれば登録できないこと' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'passwordが存在してもpassword_confirmationが空では登録できないこと' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
    end

    context '本人確認情報' do
      it 'ユーザー本名の名字が、空では登録できないこと' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("first name can't be blank")
      end

      it 'ユーザー本名の名前が、空では登録できないこと' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("last name can't be blank")
      end

      it 'ユーザーの名字は全角（漢字・ひらがな・カタカナ）で入力されていないと登録できないこと' do
        @user.first_name = 'ｱｱｱ'
        @user.valid?
        expect(@user.errors.full_messages).to include('First Name is invalid. Input full-width characters.')
      end

      it 'ユーザーの名前は全角（漢字・ひらがな・カタカナ）で入力されていないと登録できないこと' do
        @user.last_name = 'ｲｲｲ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last Name is invalid. Input full-width characters.')
      end

      it 'ユーザー本名のフリガナの名字が、空では登録できないこと' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First Name Kana can't be blank")
      end

      it 'ユーザー本名のフリガナの名前が、空では登録できないこと' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last Name Kana can't be blank")
      end

      it 'ユーザー本名のフリガナの名字は全角（カタカナ）で入力されていないと登録できないこと' do
        @user.first_name_kana = 'あああ'
        @user.valid?
        expect(@user.errors.full_messages).to include('First Name Kana is invalid. Input full-width katakana characters.')
      end

      it 'ユーザー本名のフリガナの名前は全角（カタカナ）で入力されていないと登録できないこと' do
        @user.last_name_kana = 'いいい'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last Name Kana is invalid. Input full-width katakana characters.')
      end

      it '生年月日を選択していないと登録できないこと' do
        @user.birthday = 0, 0, 0
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
