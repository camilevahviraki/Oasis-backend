class AddFieldsToItems < ActiveRecord::Migration[7.0]
  def change
    add_column :items, :shipping_options, :string
    add_column :items, :return_policy, :string
    add_column :items, :availability, :string
  end
end
