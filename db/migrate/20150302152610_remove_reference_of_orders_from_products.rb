class RemoveReferenceOfOrdersFromProducts < ActiveRecord::Migration
  def change
    remove_reference :products, :order
    add_reference :orders, :product
  end
end
