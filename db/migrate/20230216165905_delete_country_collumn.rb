class DeleteCountryCollumn < ActiveRecord::Migration[7.0]
  def change
    remove_column :stores, :country
  end
end
