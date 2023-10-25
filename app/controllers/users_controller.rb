class UsersController < ApplicationController
  def create
    @user = User.new(user_params)
    if @user.save
      # 保存が成功した場合の処理
      redirect_to @user, notice: 'User was successfully created.'
    else
      # 保存が失敗した場合の処理
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email, :password, :password_confirmation, :first_name, :last_name, :first_name_katakana, :last_name_katakana, :date_of_birth)
  end
end
  
  

