require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品の登録' do
    before do
      @item = FactoryBot.build(:item)
      @item.image = fixture_file_upload("public/images/sample.png")
    end

    context 'すべての項目が空ではないこと' do
      it 'すべての項目が入力されていれば登録できること' do
        expect(@item).to be_valid
      end

      it 'imageが空では登録できないこと' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.fullmessages).to include("Image can't be blank")
      end

      it '商品名が空では登録できないこと' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it '商品の説明が空では登録できないこと' do
        @item.info = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Info can't be blank")
      end

      it 'カテゴリーが空では登録できないこと' do
        @item.category = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it '商品の状態が空では登録できないこと' do
        @item.sales_status = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("SalesStatus can't be blank")
      end

      it '配送料の負担が空では登録できないこと' do
        @item.shipping_fee_status = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("ShippingFeeStatus can't be blank")
      end

      it '発送元の地域が空では登録できないこと' do
        @item.prefecture = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end

      it '発送までの日数が空では登録できないこと' do
        @item.scheduled_delivery = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("ScheduledDelivery can't be blank")
      end

      it '価格が空では登録できないこと' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it '販売価格は半角英数字のみ入力可能であること' do
        @item.price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid")
      end
    end
  end
end
