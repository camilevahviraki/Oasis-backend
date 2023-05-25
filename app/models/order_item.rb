class OrderItem  < ApplicationRecord
    belongs_to :item, class_name: 'Item', foreign_key: 'item_id', validate: true
    belongs_to :store, class_name: 'Store', foreign_key: 'store_id', validate: true
    belongs_to :order, class_name: 'Order', foreign_key: 'order_id', validate: true
end