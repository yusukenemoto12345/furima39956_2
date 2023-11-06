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

def show
  @item = Item.find_by(id: params[:id])

  if @item.nil?
    flash[:alert] = "指定された商品が見つかりませんでした。"
    redirect_to root_path and return
  end

  if user_signed_in?
    if @item.user == current_user && !@item.sold_out?
      @can_edit_and_delete = true
    end
    @can_purchase = !@item.sold_out? && @item.user != current_user # 本人が開いている場合に購入ボタンを非表示にする
  end
end


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













 
 
 
 