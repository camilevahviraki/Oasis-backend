class AddStoreTokenToItem < ActiveRecord::Migration[7.0]
  def change
    add_column :items, :store_token, :string
  end
end
