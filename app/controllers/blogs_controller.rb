class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]
  #before_action :logged_in_user, only: [:new, :edit, :destroy, :index, :update]
  #before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]

  def index
    @blogs = Blog.all
    @current_user = current_user
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

  end

  private

  def blog_params
    params.require(:blog).permit(:title, :content, :image, :image_cache, :email)
  end


end
