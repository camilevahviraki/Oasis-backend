class ItemImage < ApplicationRecord
  belongs_to :item, class_name: 'Item', foreign_key: 'item_id', validate: true

  has_many_attached :pictures
end
