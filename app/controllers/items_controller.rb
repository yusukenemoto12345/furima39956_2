class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  skip_before_action :authenticate_user!, only: [:index]


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

#def show
  #@item = Item.find(params[:id])
#end

private


#def shipping_fee
  # shipping_fee メソッドの定義
  # 返す値を適切に設定する
#end

#def sold_out?
  #!sold_out？ # これは sold_out フラグが nil でないかどうかを確認するものです
#end


def item_params
  params.require(:item).permit(:name, :item_image, :description, :price, :condition_id, :category_id, :shipping_fee_id, :prefecture_id, :shipping_date_id)
end
end













 
 
 
 