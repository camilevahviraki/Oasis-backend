class AddCapacitiesIdToItemCapacities < ActiveRecord::Migration[7.0]
  def change
    add_reference :item_capacities, :capacity_unit, null: false, foreign_key: true
  end
end
