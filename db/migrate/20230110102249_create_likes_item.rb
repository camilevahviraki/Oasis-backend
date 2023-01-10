class CreateLikesItem < ActiveRecord::Migration[7.0]
  def change
    create_table :likes_items do |t|

      t.timestamps
    end
  end
end
