require 'rails_helper'

RSpec.describe Product, type: :model do
  describe '#create' do
    before do
      @product = FactoryBot.build(:product)
      pending "add some examples to (or delete) #{__FILE__}"
    end

    describe '商品出品機能' do
      context '商品出品がうまくいくとき' do
        it '全ての値が入って登録できる' do
        end
      end

      context '商品出品がうまくいかないとき' do
        it '画像は空では登録できない' do
          @product.image = nil
          product.valid?
        end
        it '商品名がないと登録できない' do
          @product.name = ''
          product.valid?
        end
        it '商品の説明がないと登録できない' do
          @product.description = ''
          product.valid?
        end
        it 'カテゴリーの情報がないと登録できない' do
          @category.infomation = ''
          expect(@category).to be_valid
        end
        it '商品の状況についての情報がないと登録できない' do
          @product.status = ''
          expect(@product).to be_valid
        end
        it '配送料の負担についての情報がないと登録できない' do
          @cost.infomation = ''
          expect(@cost).to be_valid
        end
        it '発送元の地域についての情報がないと登録でない' do
          @shipping.infomation = ''
          expect(@shipping).to be_valid
        end
        it '発送までの日数についての情報がないと登録できない' do
          @day.infomation = ''
          expect(@day).to be_valid
        end
        it '価格についての情報がないと登録できない' do
          @price.infomation = ''
          expect(@price).to be_valid
        end
      end
    end
  end
end
