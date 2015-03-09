class AddReferenceOfOrdersToLineItems < ActiveRecord::Migration
  def change
    add_reference :line_items, :order
  end
end
