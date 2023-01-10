class AddRefsToOrderItems < ActiveRecord::Migration[7.0]
  def change
    add_reference :order_items, :store, foreign_key: true
    add_reference :order_items, :item, foreign_key: true
    add_reference :order_items, :order, foreign_key: true
    add_reference :order_items, :currency, foreign_key: true
  end
end
