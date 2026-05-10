class AddFieldsToStoreCategoriesLists < ActiveRecord::Migration[7.0]
  def change
    add_column :store_categories_lists, :key, :string unless column_exists?(:store_categories_lists, :key)
    add_column :store_categories_lists, :description, :text unless column_exists?(:store_categories_lists, :description)
    add_column :store_categories_lists, :icon_name, :string unless column_exists?(:store_categories_lists, :icon_name)
    add_column :store_categories_lists, :icon_color, :string unless column_exists?(:store_categories_lists, :icon_color)
    add_column :store_categories_lists, :sort_order, :integer unless column_exists?(:store_categories_lists, :sort_order)
    add_column :store_categories_lists, :active, :boolean, default: true unless column_exists?(:store_categories_lists, :active)
  end
end
