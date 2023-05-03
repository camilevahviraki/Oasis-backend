class ItemMaterial < ApplicationRecord
    belongs_to :item, class_name: 'Item', foreign_key: 'item_id', validate: true
    belongs_to :material, class_name: 'Material', foreign_key: 'material_id', validate: true
    # has_many :carts, foreign_key: 'item_material_id', dependent: :destroy

    has_one_attached :image
end    