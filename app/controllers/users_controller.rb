class UsersController < ApplicationController
  def edit
  @user = User.find(params[:id])
  end

  #ストロングパラメーター
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :icon)
  end

  def show
    @user = User.find(params[:id])
    #@favorites_blogs = @user.favorite_blogs
  end
end
