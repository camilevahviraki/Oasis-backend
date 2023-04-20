class CreateItemSizes < ActiveRecord::Migration[7.0]
  def change
    create_table :item_sizes do |t|
      t.string :name
      t.string :value
      t.string :code
      t.string :size_type

      t.timestamps
    end
  end
end
