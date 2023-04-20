class Size < ApplicationRecord
    has_many :item_sizes, foreign_key: 'size_id', dependent: :destroy
end