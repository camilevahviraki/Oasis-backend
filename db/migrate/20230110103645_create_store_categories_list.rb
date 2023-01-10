class CreateStoreCategoriesList < ActiveRecord::Migration[7.0]
  def change
    create_table :store_categories_lists do |t|
      t.string 'name'
      t.text 'icon'

      t.timestamps
    end
  end
end
