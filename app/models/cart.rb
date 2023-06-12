class Cart < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'user_id', validate: true
  belongs_to :store, class_name: 'Store', foreign_key: 'store_id', validate: true
  belongs_to :item, class_name: 'Item', foreign_key: 'item_id', validate: true
  # elbelongs_to :item_capacity, class_name: 'ItemCapacity', foreign_key: 'item_capacity_id'
  # belongs_to :item_color, class_name: 'ItemColor', foreign_key: 'item_color_id'
  # belongs_to :item_material, class_name: 'ItemMaterial', foreign_key: 'item_material_id'
  # bongs_to :item_size, class_name: 'ItemSize', foreign_key: 'item_size_id'
  has_many :cart_items, foreign_key: 'cart_id', dependent: :destroy
end
