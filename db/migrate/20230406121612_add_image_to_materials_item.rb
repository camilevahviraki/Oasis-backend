class AddImageToMaterialsItem < ActiveRecord::Migration[7.0]
  def change
    add_column :item_materials, :image, :string
  end
end
