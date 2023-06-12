class AddCategoryNameToItem < ActiveRecord::Migration[7.0]
  def change
    add_column :items, :category_name, :string
  end
end
