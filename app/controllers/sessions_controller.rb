class SessionsController < ApplicationController
  def new
  end

  def create
    if user = User.authenticate(params[:name], params[:password])
      session[:user_id] = user.id
      redirect_to products_url
    else
      redirect_to login_url, notice: 'invalid name or password'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to products_url, notice: 'logged out'
  end
end
