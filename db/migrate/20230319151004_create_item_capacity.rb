class CreateItemCapacity < ActiveRecord::Migration[7.0]
  def change
    create_table :item_capacities do |t|
      t.string :name
      t.string :value
      t.string :code

      t.timestamps
    end
  end
end
