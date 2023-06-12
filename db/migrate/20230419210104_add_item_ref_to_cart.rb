class AddItemRefToCart < ActiveRecord::Migration[7.0]
  def change
    add_reference :carts, :store, null: false, foreign_key: true
    add_reference :carts, :item, null: false, foreign_key: true
    add_reference :carts, :item_capacity, null: true, foreign_key: true
    add_reference :carts, :item_color, null: true, foreign_key: true
    add_reference :carts, :item_material, null: true, foreign_key: true
    add_reference :carts, :item_size, null: true, foreign_key: true
    add_column :carts, :quantity, :integer
  end
end
