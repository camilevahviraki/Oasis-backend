class AddStoreRefToItem < ActiveRecord::Migration[7.0]
  def change
    add_reference :items, :store, foreign_key: true
  end
end
