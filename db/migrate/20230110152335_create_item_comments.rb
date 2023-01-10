class CreateItemComments < ActiveRecord::Migration[7.0]
  def change
    create_table :item_comments do |t|
      t.text 'comment'

      t.timestamps
    end
  end
end
