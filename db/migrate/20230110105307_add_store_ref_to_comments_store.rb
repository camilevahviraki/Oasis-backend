class AddStoreRefToCommentsStore < ActiveRecord::Migration[7.0]
  def change
    add_reference :comments_stores, :store, foreign_key: true
  end
end
