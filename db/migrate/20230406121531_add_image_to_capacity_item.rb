class AddImageToCapacityItem < ActiveRecord::Migration[7.0]
  def change
    add_column :item_capacities, :image, :string
  end
end
