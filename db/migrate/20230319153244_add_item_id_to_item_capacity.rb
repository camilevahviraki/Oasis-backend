class AddItemIdToItemCapacity < ActiveRecord::Migration[7.0]
  def change
    add_reference :item_capacities, :item, null: false, foreign_key: true
  end
end
