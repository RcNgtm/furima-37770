require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.create(:item)
  end

  describe 'アイテム出品情報の保存' do
    context '出品できない場合' do
      it '商品画像が空だと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が空だと出品できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it '商品説明が空だと出品できない' do
        @item.items_explain = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Items explain can't be blank")
      end
      it 'カテゴリーが未選択だと出品できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it '商品の状態が未選択だと出品できない' do
        @item.sales_status_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Sales status can't be blank")
      end
      it '配送料の負担が未選択だと出品できない' do
        @item.shipping_fee_status_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee status can't be blank")
      end
      it '発送元の地域が未選択だと出品できない' do
        @item.prefecture_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '発送までの日数が未選択だと出品できない' do
        @item.scheduled_delivery_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Scheduled delivery can't be blank")
      end
      it '価格が空だと出品できない' do
        @item.item_price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price can't be blank")
      end
      it '価格が300以下だと出品できない' do
        @item.item_price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Item price must be greater than or equal to 300')
      end
      it '価格が9999999以上だと出品できない' do
        @item.item_price = 99999999
        @item.valid?
        expect(@item.errors.full_messages).to include('Item price must be less than or equal to 9999999')
      end
      it '価格が全角数字だと出品できない' do
        @item.item_price = '５５５'
        @item.valid?
        expect(@item.errors.full_messages).to include('Item price is not a number')
      end
      it '価格に記号があると出品できない' do
        @item.item_price = 3,000
        @item.valid?
        expect(@item.errors.full_messages).to include('Item price is not a number')
      end
      it '価格が半角英語だと出品できない' do
        @item.item_price = 'number'
        @item.valid?
        expect(@item.errors.full_messages).to include('Item price is not a number')
      end
      it '価格が全角英語だと出品できない' do
        @item.item_price = 'ｎｕｍｂｅｒ'
        @item.valid?
        expect(@item.errors.full_messages).to include('Item price is not a number')
      end
      it '価格が全角カナだと出品できない' do
        @item.item_price = '一万円'
        @item.valid?
        expect(@item.errors.full_messages).to include('Item price is not a number')
      end
      it '価格が半角カナだと出品できない' do
        @item.item_price = 'ｲﾁﾏﾝｴﾝ'
        @item.valid?
        expect(@item.errors.full_messages).to include('Item price is not a number')
      end
      it 'ユーザー情報がない場合は出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
    context '出品できる場合' do
      it '全ての情報があれば出品できる' do
        expect(@item).to be_valid
      end
    end
  end
end
