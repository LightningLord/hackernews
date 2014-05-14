class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.create(params[:user])
    if user.save
      redirect_to user_path(user)
    else
      redirect_to root_path
    end
  end
end
