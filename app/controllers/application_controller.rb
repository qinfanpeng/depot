class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :send_cart_view


  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
    redirect_to home_url
  end

  def set_locale1
    I18n.locale = params[:locale] || I18n.default_locale
  end

  private

  def current_cart
    begin
      Cart.find(session[:cart_id])
    rescue ActiveRecord::RecordNotFound
      cart = Cart.create!
      session[:cart_id] = cart.id
      cart
    end
  end

  def send_cart_view
    @cart = current_cart
  end

end
