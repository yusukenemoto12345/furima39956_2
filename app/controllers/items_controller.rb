class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :move_to_index, only: [:edit, :update ,:destroy]
  before_action :set_item, only: [:edit, :show, :update ,:destroy]



  def index
    @items = Item.order(created_at: :desc) # 新しい順に並べ替える
    @shipping_fees = ShippingFee.all
  end

  def new
    @item = Item.new
    @categories = Category.all
  end

def create
  @item = current_user.items.build(item_params)
  if @item.save
    redirect_to root_path, notice: '商品が正常に保存されました。'
  else
    @categories = Category.all
    flash.now[:alert] = '情報を保存できませんでした。入力内容を確認してください。'
    render :new , status: :unprocessable_entity
  end
end

def show
  
end

def update
  
  if @item.update(item_params)
    redirect_to item_path(@item)
  else
    render :edit,status: :unprocessable_entity
  end
end


def edit
  
end

def destroy
    @item.destroy
    redirect_to root_path
end



  #if current_user == @item.user && !Order.exists?(item_id: @item.id)
  #render :edit
  #else
  #redirect_to root_path
  #end
  #end


private

def set_item
  @item = Item.find(params[:id])
end

#def shipping_fee
  # shipping_fee メソッドの定義
  # 返す値を適切に設定する
#end

#def sold_out?
  #!sold_out？ # これは sold_out フラグが nil でないかどうかを確認するものです
#end
def move_to_index
  item = Item.find(params[:id])
  if current_user.id != item.user.id
    redirect_to root_path
  end
end

def item_params
  params.require(:item).permit(:name, :item_image, :description, :price, :condition_id, :category_id, :shipping_fee_id, :prefecture_id, :shipping_date_id)
end
end













 
 
 
 