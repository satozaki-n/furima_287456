require 'rails_helper'

RSpec.describe Purchaseform, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @user1 = FactoryBot.build(:user) # 出品者
    @user2 = FactoryBot.build(:user) # 購入者
    @purchase = FactoryBot.build(:purchaseform, item_id: @item.id, user_id: @user1.id, user_id: @user2.id )
  end

  describe '情報登録' do
    context '必要な項目を入力していれば保存できる' do
      it '必要な項目が入力されていれば登録できる' do
        expect(@purchase).to be_valid
      end
      
      it '郵便番号が空では登録できない' do
        @purchase.postal_code = ""
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Postal code can't be blank")
      end

      it '郵便番号にハイフンがないと登録できない登録できない' do
        @purchase.postal_code = "1234567"
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end

      it '都道府県が空では登録できない' do
        @purchase.prefecture_id = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Prefecture can't be blank")
      end

      it '市区町村が空では登録できない' do
        @purchase.city = ""
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("City can't be blank")
      end

      it '番地が空では登録できない' do
        @purchase.addresses = ""
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Addresses can't be blank")
      end

      it '電話番号が空では登録できない' do
        @purchase.phone_number = ""
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Phone number can't be blank")
      end

      it '電話番号が11桁以上では登録できない' do
        @purchase.phone_number = "123456789101"
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Phone number is too long")
      end

      
    end
  end
end
