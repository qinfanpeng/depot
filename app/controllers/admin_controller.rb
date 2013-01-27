class AdminController < ApplicationController
  before_filter :authoize

  def index
  end

  protected
  def authoize
    unless session[:user_id]
      redirect_to login_url, notice: 'please logo in !'
    end
  end

end
