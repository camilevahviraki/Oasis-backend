class Material < ApplicationRecord
    has_many :item_materials, foreign_key: 'material_id', dependent: :destroy
end