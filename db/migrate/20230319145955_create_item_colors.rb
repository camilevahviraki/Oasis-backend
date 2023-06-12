class CreateItemColors < ActiveRecord::Migration[7.0]
  def change
    create_table :item_colors do |t|
      t.string :name
      t.string :hex_code

      t.timestamps
    end
  end
end
