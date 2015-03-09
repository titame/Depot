class LineItemsController < ApplicationController
  include CurrentCart
  skip_before_action :authorize
  before_action :set_cart, only: [:create]

  def create
    product = Product.find(params[:product_id])
    @line_item = @cart.add_product(product.id, product.price)
    session[:counter] = 0
    respond_to do |format|
      if @line_item.save
        format.html { redirect_to store_url }
        format.js { @current_item = @line_item }
      else
        format.html { render action: 'new' }
      end
    end
  end

   def destroy
     @line_item=LineItem.find(params[:id])
     if @line_item.quantity > 1
       @line_item.quantity -= 1
       @line_item.save
     else
       @line_item.destroy
     end

     respond_to do |format|
        format.html { redirect_to store_url }
        format.js { @current_item = @line_item }
     end
   end
end
