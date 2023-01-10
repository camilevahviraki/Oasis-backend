class AddStoreCategoriesListRefToStoreCategories < ActiveRecord::Migration[7.0]
  def change
    add_reference :store_categories, :store_categories_list, foreign_key: true
  end
end
