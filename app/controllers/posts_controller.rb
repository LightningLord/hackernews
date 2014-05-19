class PostsController < ApplicationController
  include ApplicationHelper
  skip_before_action :require_login, only: [:index, :show]
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    post = current_user.posts.build(params[:post])
    if post.save
      redirect_to post_path(post)
    else
      redirect_to root_path
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy if current_user == post.user
    redirect_to root_path
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    if post.user == current_user && post.update_attributes(params[:post])
      redirect_to post_path(post)
    else
      redirect_to edit_post_path(post)
    end
  end
end
