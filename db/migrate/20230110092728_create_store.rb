class CreateStore < ActiveRecord::Migration[7.0]
  def change
    create_table :stores do |t|
      t.string 'name'
      t.string 'location'
      t.string 'open-from'
      t.string 'close-at'
      t.string 'country'
      t.string 'description'
      t.string 'info'

      t.timestamps
    end
  end
end
