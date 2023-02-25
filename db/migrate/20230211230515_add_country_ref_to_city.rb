class AddCountryRefToCity < ActiveRecord::Migration[7.0]
  def change
    add_reference :cities, :countries, foreign_key: true
  end
end
