class BlogsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]

  def new
  end

  def create
  end

  def index
  end

end
