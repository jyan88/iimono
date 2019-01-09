class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user, only: [:new, :edit, :destroy, :index, :update]
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]

  def index
    
  end

  def new
    if params[:back]
      @blog = Blog.new(blog_params)
    else
      @blog = Blog.new
    end
  end

  def create
  end

  def show
    @blog = Blog.find(params[:id])
    @favorite = current_user.favorites.find_by(blog_id: @blog.id)
  end

  private

  def blog_params
    params.require(:blog).permit(:title, :content, :image, :image_cache, :email)
  end

  def logged_in_user
    unless current_user
      flash[:referer] = 'ログインしてください'
      render new_session_path
    end
  end

end
