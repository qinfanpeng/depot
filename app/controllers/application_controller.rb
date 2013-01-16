class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :send_cart_view

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
