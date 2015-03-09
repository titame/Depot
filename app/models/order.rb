class Order < ActiveRecord::Base
  # has_many :products, inverse_of: :order
  has_many :line_items, dependent: :destroy
  has_many :products, through: :line_items
  PAYMENT_TYPES = [ "Check", "Credit card", "Purchase order" ]
  # validates :name, :address, :email, presence: true
  # validates :pay_type, inclusion: PAYMENT_TYPES
  # validates :order_date, presence: true
  # validates :mobile, :phone, presence: true, numericality: { only_integer: true}, length: { is:10 }
  # validate :phone_and_mobile_cant_be_same
  # validates_associated :products

  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      item.cart_id = nil
      line_items << item
    end
  end

  def self.by_name(name)
    Order.where("name = ?", name)
  end

  def self.by_email(email)
    Order.where("email = ?", email)
  end


  private

  # def phone_and_mobile_cant_be_same
  #   if mobile == phone
  #     errors[:phone] << "mobile and phone can't be same"
  #   end
  # end

end
