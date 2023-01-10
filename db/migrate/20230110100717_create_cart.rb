class CreateCart < ActiveRecord::Migration[7.0]
  def change
    create_table :carts do |t|
      t.string 'adress'
      t.integer 'price'
      t.string 'currency'

      t.timestamps
    end
  end
end
