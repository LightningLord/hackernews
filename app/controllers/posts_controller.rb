class PostsController < ApplicationController
  include ApplicationHelper
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    redirect_to root_path unless current_user
    @post = Post.new
  end
end
