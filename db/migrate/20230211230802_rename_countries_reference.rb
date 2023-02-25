class RenameCountriesReference < ActiveRecord::Migration[7.0]
  def change
    rename_column :cities, :countries_id, :country_id
  end
end
