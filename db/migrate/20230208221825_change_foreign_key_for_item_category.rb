class ChangeForeignKeyForItemCategory < ActiveRecord::Migration[7.0]
  def change
    rename_column :item_categories, :item_categories_lists_id, :item_categories_list_id
  end
end
