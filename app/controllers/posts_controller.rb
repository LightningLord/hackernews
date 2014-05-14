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

  def create
    redirect_to root_path unless current_user
    post = current_user.posts.build(params[:post])
    if post.save
      redirect_to post_path(post)
    else
      redirect_to root_path
    end
  end
end
