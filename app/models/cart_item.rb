class CartItem < ApplicationRecord
    belongs_to :cart, :class_name => 'Cart', :foreign_key => 'cart_id', :validate => true
    belongs_to :item, :class_name => 'Item', :foreign_key => 'item_id', :validate => true
    belongs_to :store, :class_name => 'Store', :foreign_key => 'store_id', :validate => true
end
