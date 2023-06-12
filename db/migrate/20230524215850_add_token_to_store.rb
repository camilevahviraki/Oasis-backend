class AddTokenToStore < ActiveRecord::Migration[7.0]
  def change
    add_column :stores, :token_id, :string
  end
end
