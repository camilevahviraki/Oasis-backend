class AddColorsIdToItemColors < ActiveRecord::Migration[7.0]
  def change
    add_reference :item_colors, :color, null: false, foreign_key: true
  end
end
