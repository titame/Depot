class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.datetime :order_date
      t.belongs_to :user

      t.timestamps
    end
  end
end
