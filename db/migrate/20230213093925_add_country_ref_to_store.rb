class AddCountryRefToStore < ActiveRecord::Migration[7.0]
  def change
    add_reference :stores, :country, foreign_key: true
  end
end
