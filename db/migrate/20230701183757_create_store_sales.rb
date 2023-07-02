class CreateStoreSales < ActiveRecord::Migration[7.0]
  def change
    create_table :store_sales do |t|

      t.string :adress
      t.integer :unit_price
      t.integer :price_paid
      t.integer :quantity
      t.integer :item_id
      t.integer :item_capacity_id
      t.integer :item_color_id 
      t.integer :item_material_id
      t.integer :item_size_id

      t.timestamps
    end
  end
end
