class RenameCollumnMainName < ActiveRecord::Migration[7.0]
  def change
    rename_column :items, :mainName, :main_name
  end
end
