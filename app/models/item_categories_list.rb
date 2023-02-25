class ItemCategoriesList < ApplicationRecord
  has_many :item_categories, foreign_key: 'item_categories_list_id', dependent: :destroy
end
