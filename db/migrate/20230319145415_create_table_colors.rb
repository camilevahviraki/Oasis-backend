class CreateTableColors < ActiveRecord::Migration[7.0]
  def change
    create_table :colors do |t|
      t.string :name
      t.string :hex_code

      t.timestamps
    end
  end
end
