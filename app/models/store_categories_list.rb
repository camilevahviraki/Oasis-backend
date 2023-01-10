class StoreCategoriesList < ApplicationRecord
  has_many :store_categories,  foreign_key: 'store_categories_list_id', dependent: :destroy
end
