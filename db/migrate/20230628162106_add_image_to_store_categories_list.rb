class AddImageToStoreCategoriesList < ActiveRecord::Migration[7.0]
  def change
    add_column :store_categories_lists, :image, :string
  end
end
