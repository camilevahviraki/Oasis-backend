class AddLatitudeToCountry < ActiveRecord::Migration[7.0]
  def change
    add_column :countries, :latitude, :integer
    add_column :countries, :longitude, :integer
  end
end
