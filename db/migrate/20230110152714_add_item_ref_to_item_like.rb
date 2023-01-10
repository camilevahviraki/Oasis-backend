class AddItemRefToItemLike < ActiveRecord::Migration[7.0]
  def change
    add_reference :likes_items, :item, foreign_key: true
  end
end
