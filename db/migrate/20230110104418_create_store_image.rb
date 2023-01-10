class CreateStoreImage < ActiveRecord::Migration[7.0]
  def change
    create_table :store_images do |t|
      t.text 'pictures'
      t.text 'description'

      t.timestamps
    end
  end
end
