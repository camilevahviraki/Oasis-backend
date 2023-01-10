class CreateItem < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.text 'names'
      t.string 'mainName'

      t.timestamps
    end
  end
end
