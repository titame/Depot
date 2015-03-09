class AddProductsPriceToLineItems < ActiveRecord::Migration
  def change
    add_column :line_items, :price, :integer
    reversible do |r|
      r.up  { LineItem.all.each {|i| i.update(price: i.product.price)} }
    end
  end
end
