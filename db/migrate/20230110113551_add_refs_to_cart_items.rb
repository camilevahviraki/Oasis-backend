class AddRefsToCartItems < ActiveRecord::Migration[7.0]
  def change
    add_reference :cart_items, :store, foreign_key: true
    add_reference :cart_items, :item, foreign_key: true
    add_reference :cart_items, :cart, foreign_key: true
  end
end
