class AddImageToSizeImage < ActiveRecord::Migration[7.0]
  def change
    add_column :item_sizes, :image, :string
  end
end
