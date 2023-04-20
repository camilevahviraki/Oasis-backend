class CapacityUnit < ApplicationRecord
    has_many :item_capacities, foreign_key: 'capacity_unit_id', dependent: :destroy
end