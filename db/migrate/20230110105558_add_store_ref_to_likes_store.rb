class AddStoreRefToLikesStore < ActiveRecord::Migration[7.0]
  def change
    add_reference :likes_stores, :store, foreign_key: true
  end
end
