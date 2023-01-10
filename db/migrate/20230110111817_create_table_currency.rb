class CreateTableCurrency < ActiveRecord::Migration[7.0]
  def change
    create_table :currencies do |t|
      t.string 'symbole'
      t.string 'name'
      t.integer 'exchange'
      t.string 'country'

      t.timestamps
    end
  end
end
