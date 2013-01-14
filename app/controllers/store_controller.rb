class StoreController < ApplicationController
  def index
    render json:  @products = Product.all.map{|p| p.title}
  end
end
