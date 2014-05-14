class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.create(params[:user])
    if user.save
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      redirect_to root_path
    end
  end

  def show
    @user = User.find(session[:user_id])
  end
end
