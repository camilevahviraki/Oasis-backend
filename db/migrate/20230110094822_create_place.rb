class CreatePlace < ActiveRecord::Migration[7.0]
  def change
    create_table :places do |t|
      t.string 'name'
      t.string 'longitude'
      t.string 'latitude'
      t.string 'postal-adresse'

      t.timestamps
    end
  end
end
