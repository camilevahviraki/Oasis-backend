class AddCoordinatesToStore < ActiveRecord::Migration[7.0]
  def change
    add_column :stores, :coordinates, :string
  end
end
