class  ItemColor < ApplicationRecord
    belongs_to :item, class_name: 'Item', foreign_key: 'item_id', validate: true
    belongs_to :color, class_name: 'Color', foreign_key: 'color_id', validate: true
    # has_many :carts, foreign_key: 'item_color_id', dependent: :destroy

    has_one_attached :image
end