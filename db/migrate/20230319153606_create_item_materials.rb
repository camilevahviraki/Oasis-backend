class CreateItemMaterials < ActiveRecord::Migration[7.0]
  def change
    create_table :item_materials do |t|
      t.string :name
      t.string :code

      t.timestamps
    end
  end
end
