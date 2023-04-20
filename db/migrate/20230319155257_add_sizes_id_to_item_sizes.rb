class AddSizesIdToItemSizes < ActiveRecord::Migration[7.0]
  def change
    add_reference :item_sizes, :size, null: false, foreign_key: true
  end
end
