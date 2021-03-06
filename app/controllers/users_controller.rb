class UsersController < ApplicationController
before_action :correct_user, only: [:edit, :show, :update]
  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
    @current_user = User.find(params[:id])
    @favorites_blogs = @user.favorite_blogs
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path, notice: "ユーザー情報を変更しました！"
    else
      render 'edit'
    end
  end

  private

  def user_params
   params.require(:user).permit(:name, :email, :password, :password_confirmation, :image, :image_cache, :icon, :icon_cache, :address)
  end

  def set_user
   @user = User.find(params[:id])
  end


  def correct_user
    user = User.find(params[:id])
    if current_user != user
      redirect_to blog_path
    end
  end

end
