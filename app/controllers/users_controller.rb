class UsersController < ApplicationController
  def edit
  @user = User.find(params[:id])
end

  #ストロングパラメーター
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :image)
  end
end
