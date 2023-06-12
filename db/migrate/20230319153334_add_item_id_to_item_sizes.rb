class AddItemIdToItemSizes < ActiveRecord::Migration[7.0]
  def change
    add_reference :item_sizes, :item, null: false, foreign_key: true
  end
end
