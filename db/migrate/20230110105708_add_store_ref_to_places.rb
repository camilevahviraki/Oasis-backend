class AddStoreRefToPlaces < ActiveRecord::Migration[7.0]
  def change
    add_reference :places, :store, foreign_key: true
  end
end
