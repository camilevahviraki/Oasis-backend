class AddTokenToOrder < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :token_id, :string
  end
end
