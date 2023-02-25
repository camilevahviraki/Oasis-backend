class StoreCategoriesList < ApplicationRecord
  has_many :store_categories, foreign_key: 'item_categories_lists_id', dependent: :destroy
end
