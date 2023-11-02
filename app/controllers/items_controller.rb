class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def new
    @item = Item.new
    @categories = Category.all
  end

  def create
    @item = current_user.items.build(item_params)
    if @item.save
      redirect_to root_path, notice: '商品が正常に保存されました。'
    else
      flash.now[:alert] = '情報を保存できませんでした。入力内容を確認してください。'
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:name,:item_image, :description, :price, :condition_id, :category_id, :shipping_fee_id, :prefecture_id, :shipping_date_id)
  end
end


  
  
  
  
  
  
























 
 
 
 