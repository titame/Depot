class AddColumnsToOrders < ActiveRecord::Migration
  def change
    change_table :orders do |t|
      t.string :name
      t.text :address
      t.string :email
      t.string :pay_type
    end
  end
end
