class CreateOrder < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string 'currency'
      t.string 'destination'

      t.timestamps
    end
  end
end
