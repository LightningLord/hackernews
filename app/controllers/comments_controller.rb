class CommentsController < ApplicationController
  include ApplicationHelper
  def create
    comment = Post.find(params[:post_id]).comments.build(params[:comment])
    comment.user = current_user
    comment.save
    redirect_to post_path(comment.post)
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    comment = Comment.find(params[:id])
    if comment.user == current_user && comment.update_attributes(params[:comment])
      redirect_to post_path(comment.post)
    else
      redirect_to edit_post_comment_path(comment.post, comment)
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy if comment.user == current_user
    redirect_to post_path(comment.post)
  end

end
