class AddAttributesToOrderItems < ActiveRecord::Migration[7.0]
  def change
    add_column :order_items, :item_attributes, :text
  end
end
