require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_form = FactoryBot.build(:order_form)
  end

  describe '商品購入情報の保存' do
    context '商品購入情報を保存できる時' do
      it 'すべての値が正しく入力されていれば保存できる' do
        expect(@order_form).to be_valid
      end
      it 'buildingは空でも保存できる' do
        @order_form.building = ''
        expect(@order_form).to be_valid
      end
    end

    context '商品購入情報を保存できないとき' do
      it 'tokenが空では保存できない' do
        @order_form.token = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Token can't be blank")
      end

      it 'postcodeが空では保存できない' do
        @order_form.postcode = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Postcode is invalid. Include hyphen(-)')
      end

      it 'prefecture_idが空では保存できない' do
        @order_form.prefecture_id = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'cityが空では保存できない' do
        @order_form.city = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("City can't be blank")
      end

      it 'blockが空では保存できない' do
        @order_form.block = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Block can't be blank")
      end

      it 'phone_numberが空では保存できない' do
        @order_form.phone_number = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'postcodeはハイフンがないと保存できない' do
        @order_form.postcode = '1234567'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Postcode is invalid. Include hyphen(-)')
      end

      it 'postcodeは半角英数混合では保存できない' do
        @order_form.postcode = '123-45ab'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Postcode is invalid. Include hyphen(-)')
      end

      it 'postcodeは全角では保存できない' do
        @order_form.postcode = '１２３-４５６７'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Postcode is invalid. Include hyphen(-)')
      end

      it 'prefecture_idは選択していないと保存できない' do
        @order_form.prefecture_id = '1'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Prefecture Prefecture must be other than 1')
      end

      it 'phone_numberは12桁の数字では保存できない' do
        @order_form.phone_number = '090123456789'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Phone number is invalid')
      end
      
      it 'phone_numberは9桁以下の数字では保存できない' do
        @order_form.phone_number = '090123456'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Phone number is invalid')
      end

      it 'phone_numberは半角英数混合では保存できない' do
        @order_form.phone_number = 'abc123456789'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Phone number is invalid')
      end

      it 'phone_numberは全角では保存できない' do
        @order_form.phone_number = '０９０１２３４５６７８'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Phone number is invalid')
      end

      it 'user_idが空だと保存できない' do
        @order_form.user_id = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("User can't be blank")
      end

      it 'item_idが空だと保存できない' do
        @order_form.item_id = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
