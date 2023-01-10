class AddItemRefToItemCategory < ActiveRecord::Migration[7.0]
  def change
    add_reference :item_categories, :item, foreign_key: true
    add_reference :item_categories, :item_categories_lists, foreign_key: true
  end
end
