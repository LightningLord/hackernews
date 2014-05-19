class CommentsController < ApplicationController
  include ApplicationHelper
  def create
    if current_user
      comment = Post.find(params[:post_id]).comments.build(params[:comment])
      comment.user = current_user
      comment.save
      redirect_to post_path(comment.post)
    else
      redirect_to new_session_path
    end

  end

  def edit
    redirect_to new_session_path unless current_user
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
