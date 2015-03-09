class CartsController < ApplicationController
  skip_before_action :authorize, only: [:create, :update, :destroy]
  before_action :set_cart, only: [:destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_cart

  def show
     @my_cart = Cart.find(params[:id])
  end

  def destroy
    @cart.destroy if @cart.id == session[:cart_id]
    session[:cart_id] = nil
    session[:counter] = 0
    redirect_to store_url
  end

  private

    def set_cart
      @cart = Cart.find(params[:id])
    end

    def invalid_cart
      logger.error "Attempt to access invalid cart #{params[:id]}"
      redirect_to store_url, notice: 'Invalid cart'
    end
end
