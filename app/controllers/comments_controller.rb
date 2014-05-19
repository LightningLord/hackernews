class CommentsController < ApplicationController
  include ApplicationHelper
  def create
    comment = Post.find(params[:post_id]).comments.build(params[:comment])
    comment.user = current_user
    comment.save
    redirect_to post_path(comment.post)
  end
end
