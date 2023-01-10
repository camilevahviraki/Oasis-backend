class StoreCategory < ApplicationRecord
    belongs_to :store, :class_name => 'Store', :foreign_key => 'store_id', :validate => true
    belongs_to :store_categories_list, :class_name => 'StoreCategoriesList', :foreign_key => 'store_categories_list_id', :validate => true
end
