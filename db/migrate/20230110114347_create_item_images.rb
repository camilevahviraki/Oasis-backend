class CreateItemImages < ActiveRecord::Migration[7.0]
  def change
    create_table :item_images do |t|
      t.text 'pictures'
      t.text 'description'

      t.timestamps
    end
  end
end
