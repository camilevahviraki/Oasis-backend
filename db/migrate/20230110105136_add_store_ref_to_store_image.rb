class AddStoreRefToStoreImage < ActiveRecord::Migration[7.0]
  def change
    add_reference :store_images, :store, foreign_key: true
  end
end
