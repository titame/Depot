class LineItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :cart
  belongs_to :order
  validates :cart, :product, presence: true
  # validates :product_id, presence: true
  # validates :cart_id, presence:true

  def total_price
    product.price * quantity
  end
end
