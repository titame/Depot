class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.decimal :price
      t.text :description
      t.string :img_url
      t.belongs_to :order

      t.timestamps
    end
  end
end
