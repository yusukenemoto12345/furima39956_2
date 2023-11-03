require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '正常系' do
    it '商品出品' do
      expect(@item).to be_valid
    end
  end

  describe '異常系' do
    it '画像登録 画像が空では登録できない' do
      @item.item_image = nil
      @item.valid?
      expect(@item.errors[:item_image]).to include("can't be blank")
    end

    it '商品説明 商品説明がないと登録できない' do
      @item.description = nil
      @item.valid?
      expect(@item.errors[:description]).to include("can't be blank")
    end

    it '商品カテゴリーがない場合は登録できない' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors[:category_id]).to include("must be other than 1")
    end

    it '商品の状態がない場合は登録できない' do
      @item.condition_id = 1
      @item.valid?
      expect(@item.errors[:condition_id]).to include("must be other than 1")
    end

    it '配送料の負担の情報がない場合は登録できない' do
      @item.shipping_fee_id = 1
      @item.valid?
      expect(@item.errors[:shipping_fee_id]).to include("must be other than 1")
    end

    it '発送元の地域の情報がない場合は登録できない' do
      @item.prefecture_id = 1
      @item.valid?
      expect(@item.errors[:prefecture_id]).to include("must be other than 1")
    end

    it '発送までの日数の情報がない場合は登録できない' do
      @item.shipping_date_id = 1
      @item.valid?
      expect(@item.errors[:shipping_date_id]).to include("must be other than 1")
    end

    it '価格の情報がない場合は登録できない' do
      @item.price = nil
      @item.valid?
      expect(@item.errors[:price]).to include("can't be blank")
    end
    
    it '価格が300円未満では出品できない' do
      @item.price = 299
      @item.valid?
      expect(@item.errors[:price]).to include("must be greater than or equal to 300")
    end

    it '価格が9,999,999円を超えると出品できない' do
      @item.price = 10_000_000
      @item.valid?
      expect(@item.errors[:price]).to include("must be less than or equal to 9999999")
    end

    it '価格は半角数値のみでない場合は登録できない' do
      @item.price = "１０００"
      @item.valid?
      expect(@item.errors[:price]).to include("is not a number")
    end

    it 'ユーザー情報がない場合は登録できない' do
      @item.user_id = nil
      @item.valid?
      expect(@item.errors[:user_id]).to include("can't be blank")
    end
  end
end






