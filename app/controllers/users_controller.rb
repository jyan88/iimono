class UsersController < ApplicationController
  #before_action :login_user, only: [:show]

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @current_user = User.find(params[:id])
    #@favorites_blogs = @user.favorite_blogs
  end

  private

  def user_params
   params.require(:user).permit(:name, :email, :password, :password_confirmation, :image, :image_cache, :icon, :icon_cache)
  end

  def set_user
   @user = User.find(params[:id])
  end

end
