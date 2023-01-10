class CreateItemLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :item_likes do |t|

      t.timestamps
    end
  end
end
