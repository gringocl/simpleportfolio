class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.where(email: params[:email]).first
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "Signed in successfully!"
      redirect_to root_path
    else
      flash[:error] = "Sorry!"
      render :new
    end
  end
end
