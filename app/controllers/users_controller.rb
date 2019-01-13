class UsersController < ApplicationController
  #before_action :correct_user, only: [:edit, :show, :edit, :update]

  def edit
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  #ストロングパラメーター
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :icon)
  end

  def show
    #@user = User.find(params[:id])
    #@favorites_blogs = @user.favorite_blogs
  end

  private

 def user_params
   params.require(:user).permit(:name, :email, :password, :password_confirmation, :image, :image_cache, :icon)
 end

 def set_user
   @user = User.find(params[:id])
 end

end
