class CreateOrderItem < ActiveRecord::Migration[7.0]
  def change
    create_table :order_items do |t|
      t.integer 'exchange'
      t.text 'currency'
      t.integer 'price'

      t.timestamps
    end
  end
end
