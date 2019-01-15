class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:index, :new, :create, :edit, :update, :destroy]
  before_action :ensure_correct_user, only: [:update, :destroy, :edit]

  PER = 8

  def index
    @blogs = Blog.all
    @current_user = current_user
    @blogs = Blog.page(params[:page]).per(PER)
  end

  def new
    if params[:back]
      @blog = Blog.new(blog_params)
    else
      @blog = Blog.new
    end
  end

  def create
    @blog = Blog.new(blog_params)
    @blog.user_id = current_user.id #現在ログインしているuserのidを、blogのuser_idカラムに挿入する
      if @blog.save
      # 一覧画面へ遷移して"投稿しました！"とメッセージを表示します。
        redirect_to blogs_path, notice: "おすすめしました！"
      #BlogMailer.blog_mail(@blog).deliver
      else
      # 入力フォームを再描画します。
        render 'new'
      end
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def update
    @blog = Blog.find(params[:id])
      if @blog.update(blog_params)
        redirect_to blogs_path, notice: "おすすめを編集しました！"
      else
        render 'edit'
      end
  end

  def destroy
    @blog.destroy
    redirect_to blogs_path, notice:"投稿を削除しました！"
  end

  def show
    @blog = Blog.find(params[:id])
    @favorite = current_user.favorites.find_by(blog_id: @blog.id)
  end

  def confirm
    @blog = Blog.new(blog_params)
    @blog.user_id = current_user.id #現在ログインしているuserのidを、blogのuser_idカラムに挿入する
    render :new if @blog.invalid?
  end

  private

  def set_blog
    @blog = Blog.find(params[:id])
  end

  def blog_params
    params.require(:blog).permit(:title, :content, :image, :image_cache, :email, :address)
  end

  def ensure_correct_user
    @blog = Blog.find_by(id:params[:id])
    if @blog.user_id != current_user.id
      flash[:notice] = "権限がありません"
      redirect_to blog_path
    end
  end

end
