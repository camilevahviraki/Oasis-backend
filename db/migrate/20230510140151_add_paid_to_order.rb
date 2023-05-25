class AddPaidToOrder < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :paid, :string
  end
end
