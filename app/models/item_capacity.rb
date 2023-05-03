class ItemCapacity < ApplicationRecord
    belongs_to :item, class_name: 'Item', foreign_key: 'item_id', validate: true
    belongs_to :capacity_unit, class_name: 'CapacityUnit', foreign_key: 'capacity_unit_id', validate: true
    # has_many :carts, foreign_key: 'item_capacity_id', dependent: :destroy

    has_one_attached :image
end
