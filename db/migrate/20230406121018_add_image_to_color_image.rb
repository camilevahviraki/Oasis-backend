class AddImageToColorImage < ActiveRecord::Migration[7.0]
  def change
    add_column :item_colors, :image, :string
  end
end
