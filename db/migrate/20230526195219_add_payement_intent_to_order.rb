class AddPayementIntentToOrder < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :payed, :string
    add_column :orders, :payment_intent, :string
  end
end
