class AddPicturesToItem < ActiveRecord::Migration[7.0]
  def change
    add_column :items, :pictures, :string
    add_column :items, :price, :integer
    add_column :items, :currency, :string
    add_column :items, :description, :text
  end
end
