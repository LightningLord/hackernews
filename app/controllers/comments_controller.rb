class CommentsController < ApplicationController
  def create
    @comment = Post.find(params[:post_id]).comments.build(params[:comment])
    @comment.user = current_user
    @comment.save
    render :partial => "comment", locals: {:comment => @comment, :post => @comment.post}
  end

  def edit
    @comment = Comment.find(params[:id])
    render :partial => "edit", locals: {:comment => @comment, :post => @comment.post}
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.user == current_user && @comment.update_attributes(params[:comment])
      render :partial => "comment", locals: {:comment => @comment, :post => @comment.post}
    else
      render :partial => "not_owner"
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy if comment.user == current_user
  end

end
