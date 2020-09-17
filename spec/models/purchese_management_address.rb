  
require 'rails_helper'

RSpec.describe PurcheseManagementAddress, type: :model do
  describe '購入情報の保存' do
    before do
      @purchese_management_address = FactoryBot.build(:purchese_management_address)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@purchese_management_address).to be_valid
    end
    it 'tokenが空欄だと保存できない' do
      @purchese_management_address.token = nil
      @purchese_management_address.valid?
      expect(@purchese_management_address.errors.full_messages).to include("Token can't be blank")
    end
    it 'zip_codeが空欄だと保存できない' do
      @purchese_management_address.zip_code = nil
      @purchese_management_address.valid?
      expect(@purchese_management_address.errors.full_messages).to include("Zip code can't be blank", 'Zip code is invalid')
    end
    it 'zip_codeにハイフンが含まれないと保存できない' do
      @purchese_management_address.zip_code = '1234567'
      @purchese_management_address.valid?
      expect(@purchese_management_address.errors.full_messages).to include('Zip code is invalid')
    end
    it 'shipping_areaが空欄だと保存できない' do
      @purchese_management_address.shipping_area= nil
      @purchese_management_address.valid?
      expect(@purchese_management_address.errors.full_messages).to include("Shipping area can't be blank")
    end
    it 'cityが空欄だと保存できない' do
      @purchese_management_address.city = nil
      @purchese_management_address.valid?
      expect(@purchese_management_address.errors.full_messages).to include("City can't be blank")
    end
    it 'addressが空欄だと保存できない' do
      @purchese_management_address.address = nil
      @purchese_management_address.valid?
      expect(@purchese_management_address.errors.full_messages).to include("Address can't be blank")
    end
    it 'phoneが空欄だと保存できない' do
      @purchese_management_address.phone = nil
      @purchese_management_address.valid?
      expect(@purchese_management_address.errors.full_messages).to include("Phone can't be blank")
    end
    it 'Phoneが11桁以上だと保存できない' do
      @purchese_management_address.phone = '123456789000'
      @purchese_management_address.valid?
      expect(@purchese_management_address.errors.full_messages).to include('Phone is invalid')
    end
  end
end