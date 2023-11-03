require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @user = FactoryBot.create(:user)
    file_path = Rails.root.join('spec', 'fixtures', 'files', 'example.jpg')
    file = Rack::Test::UploadedFile.new(file_path, 'image/jpeg')
    @item = FactoryBot.build(:item, user: @user, item_image: file)
  end

  describe '正常系' do
    context '商品出品' do
      it '必要な情報を適切に入力して「出品する」ボタンを押すと、商品情報がデータベースに保存される' do
        expect(@item).to be_valid
      end
    end
  end

  describe '異常系' do
    context '画像登録' do
      it '画像が空では登録できない' do
        item = FactoryBot.build(:item, item_image: nil)
        item.valid?
        expect(item.errors[:item_image]).to include("can't be blank")
      end
    end
    
    context '商品説明' do
      it '商品説明がないと登録できない' do
        item = FactoryBot.build(:item, description: nil)
        item.valid?
        expect(item.errors[:description]).to include("can't be blank")
      end
    
      it '商品カテゴリーがない場合は登録できない' do
        item = FactoryBot.build(:item, category_id: nil)
        item.valid?
        expect(item.errors[:category_id]).to include("can't be blank")
      end
    
      it '商品の状態がない場合は登録できない' do
        item = FactoryBot.build(:item, condition_id: nil)
        item.valid?
        expect(item.errors[:condition_id]).to include("can't be blank")
      end
    end
              
 context '配送説明' do
 it '配送料の負担の情報がない場合は登録できない' do
  item = FactoryBot.build(:item, shipping_fee_id: nil)
 item.valid?
  expect(item.errors[:shipping_fee_id]).to include("can't be blank")
  end
              
  it '発送元の地域の情報がない場合は登録できない' do
    item = FactoryBot.build(:item, prefecture_id: nil)
    item.valid?
    expect(item.errors[:prefecture_id]).to include("can't be blank")
  end
              
  it '発送までの日数の情報がない場合は登録できない' do
    item = FactoryBot.build(:item, shipping_date_id: nil)
    item.valid?
    expect(item.errors[:shipping_date_id]).to include("can't be blank")
    end
      end
              
  context '価格説明' do
   it '価格の情報がない場合は登録できない' do
   item = FactoryBot.build(:item, price: nil)
    item.valid?
  expect(item.errors[:price]).to include("can't be blank")
  end
              
  it '価格は、¥300~¥9,999,999の間のみでない場合は登録できない' do
    item = FactoryBot.build(:item, price: 200)
    item.valid?
    expect(item.errors[:price]).to include("must be greater than or equal to 300")
     item = FactoryBot.build(:item, price: 10000000)
    item.valid?
   expect(item.errors[:price]).to include("must be less than or equal to 9999999")
  end
                    
     it '価格は半角数値のみでない場合は登録できない' do
      item = FactoryBot.build(:item, price: "１０００")
      item.valid?
      expect(item.errors[:price]).to include("is not a number")

     end
    end
    end
    end
              
              