class ItemSize < ApplicationRecord
  belongs_to :item, class_name: 'Item', foreign_key: 'item_id', validate: true
  belongs_to :size, class_name: 'Size', foreign_key: 'size_id', validate: true
  # has_many :carts, foreign_key: 'item_size_id', dependent: :destroy

  has_one_attached :image
end
