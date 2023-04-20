class AddItemIdToDiscounts < ActiveRecord::Migration[7.0]
  def change
    add_reference :discounts, :item, null: false, foreign_key: true
  end
end
