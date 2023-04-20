class AddMaterialsIdToItemMaterials < ActiveRecord::Migration[7.0]
  def change
    add_reference :item_materials, :material, null: false, foreign_key: true
  end
end
