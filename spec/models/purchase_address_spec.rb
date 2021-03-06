require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  describe '購入情報の保存' do
    before do
      @purchase_address = FactoryBot.build(:purchase_address)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@purchase_address).to be_valid
    end

    it 'tokenが空では登録できないこと' do
      @purchase_address.token = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
    end

    it '郵便番号が空では登録できない' do
      @purchase_address.postal_code = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Postal code can't be blank")
    end
    it '郵便番号にハイフンが含まれていばければ保存されない' do
      @purchase_address.postal_code = 4_567_893
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include('Postal code Input correctly')
    end
    it '電話番号が空では登録できない' do
      @purchase_address.telephone_number = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Telephone number can't be blank")
    end
    it '電話番号にハイフンが含まれていると保存できない' do
      @purchase_address.telephone_number = '345-35467-347'
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include('Telephone number Input only number')
    end
    it '電話番号が11桁を超えると登録できない' do
      @purchase_address.telephone_number = 767_689_765_432

      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include
    end
    it '都道府県を選択していないと登録できない' do
      @purchase_address.prefecture_id = 0
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include('Prefecture Select')
    end
    it '市区町村が空では登録できない' do
      @purchase_address.municipality = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Municipality can't be blank")
    end
    it '番地が空では登録できない' do
      @purchase_address.street_number = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Street number can't be blank")
    end
    it '建物名が空でも登録できる' do
      @purchase_address.building_name = nil
      expect(@purchase_address).to be_valid
    end
  end
end
