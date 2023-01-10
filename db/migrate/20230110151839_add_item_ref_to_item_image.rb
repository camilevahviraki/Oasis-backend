class AddItemRefToItemImage < ActiveRecord::Migration[7.0]
  def change
    add_reference :item_images, :item, foreign_key: true
  end
end
