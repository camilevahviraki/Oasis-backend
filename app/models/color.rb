class Color < ApplicationRecord
   has_many :item_colors, foreign_key: 'color_id', dependent: :destroy
end    