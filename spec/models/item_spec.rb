require 'rails_helper'
RSpec.describe Item, type: :model do
before do
  @item = FactoryBot.build(:item)
  @item.image = fixture_file_upload('public/images/sample.png')
end

    context 'すべての項目が空ではないこと' do
      it 'すべての項目が入力されていれば登録できること' do
        expect(@item).to be_valid
      end

      it 'imageが空では登録できないこと' do
        @item.image = ""
        @item.valid?
        expect(@item.errors.full_messages).to include( )
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
        @item.category = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it '商品の状態が空では登録できないこと' do
        @item.sales_status = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Sales status can't be blank")
      end

      it '配送料の負担が空では登録できないこと' do
        @item.shipping_fee_status = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee status can't be blank")
      end

      it '発送元の地域が空では登録できないこと' do
        @item.prefecture = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end

      it '発送までの日数が空では登録できないこと' do
        @item.scheduled_delivery = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Scheduled delivery can't be blank")
      end

      it '価格が空では登録できないこと' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it '販売価格は半角英数字のみ入力可能であること' do
        @item.price = "３００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

      it '価格が¥300よりも小さい金額の場合出品できない' do
        @item.price = "299"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end

      it '価格が¥9,999,999より大きい金額の場合出品できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
    end
    
   context 'プルダウンの項目で、 id1,name:-- が選択された場合登録できないこと' do
    
      it 'カテゴリーで id1,name:-- が選択された場合保存できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end

      it '商品の状態で id1,name:-- が選択された場合保存できない' do
        @item.sales_status_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Sales status must be other than 1")
      end

      it '配送料の負担で id1,name:-- が選択された場合保存できない' do
        @item.shipping_fee_status_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee status must be other than 1")
      end

      it '発送元の地域で id1,name:-- が選択された場合保存できない' do
        @item.prefecture_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
      end

      it '発送までの日数で id1,name:-- が選択された場合保存できない' do
        @item.scheduled_delivery_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Scheduled delivery must be other than 1")
      end
   end
end
