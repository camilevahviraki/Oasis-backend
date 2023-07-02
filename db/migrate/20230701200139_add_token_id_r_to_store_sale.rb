class AddTokenIdRToStoreSale < ActiveRecord::Migration[7.0]
  def change
    add_column :store_sales, :token_id, :string
  end
end
