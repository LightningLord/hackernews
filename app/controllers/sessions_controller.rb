class SessionsController < ApplicationController
  def new

  end

  def create
    user = User.find_by_name(params[:name])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
    end
    redirect_to root_path
  end
end
