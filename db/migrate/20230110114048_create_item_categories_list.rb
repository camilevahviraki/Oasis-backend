class CreateItemCategoriesList < ActiveRecord::Migration[7.0]
  def change
    create_table :item_categories_lists do |t|
      t.string 'name'
      t.text 'icon'
      t.text 'description'

      t.timestamps
    end
  end
end
