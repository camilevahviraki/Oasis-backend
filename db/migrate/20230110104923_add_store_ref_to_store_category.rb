class AddStoreRefToStoreCategory < ActiveRecord::Migration[7.0]
  def change
    add_reference :store_categories, :store, foreign_key: true
  end
end
