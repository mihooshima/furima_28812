require 'rails_helper'

RSpec.describe Product, type: :model do
  # describe '#create' do
    before do
      @product = FactoryBot.build(:product)
      # pending "add some examples to (or delete) #{__FILE__}"
    end

    describe '商品出品機能' do
      context '商品出品がうまくいくとき' do
        it '全ての値が入って登録できる' do
          expect(@product).to be_valid
        end
      end

      context '商品出品がうまくいかないとき' do
        it'画像が空では登録できない' do
          @product.image = ''
          @product.valid?
          expect(@product.errors.full_messages).to include("Image can't be blank")
        end
        it '商品名が空では登録できない' do
          @product.name = ''
          @product.valid?
          expect(@product.errors.full_messages).to include("Name can't be blank")
        end
        it '商品の説明が空では登録できない' do
          @product.explanation = ''
          @product.valid?
          expect(@product.errors.full_messages).to include("Explanation can't be blank")
        end
        it 'カテゴリーの情報が空では登録できない' do
          @product.category_id = 1
          @product.valid?
          expect(@product.errors.full_messages).to include("Category must be greater than 1")
        end
        it '商品の状況についての情報が空では登録できない' do
          @product.products_status_id = ""
          @product.valid?
          expect(@product.errors.full_messages).to include("Products status can't be blank")
        end
        it '配送料の負担についての情報が空では登録できない' do
          @product.shipping_cost_id = 1
          @product.valid?
          expect(@product.errors.full_messages).to include("Shipping cost must be greater than 1")
        end
        it '発送元の地域についての情報が空では登録でない' do
          @product.shipping_id = 1
          @product.valid?
          expect(@product.errors.full_messages).to include("Shipping must be greater than 1")
        end
        it '発送までの日数についての情報が空では登録できない' do
          @product.day_id = 1
          @product.valid?
          expect(@product.errors.full_messages).to include("Day must be greater than 1")
        end
        it '価格についての情報が空では登録できない' do
          @product.price = ¥300~¥9,999,999
          @product.valid?
          expect(@product.errors.full_messages).to include("Price can't be blank")
        end
      end
    end
end
