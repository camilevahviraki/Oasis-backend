class CreateCommentsItem < ActiveRecord::Migration[7.0]
  def change
    create_table :comments_items do |t|
      t.text 'text'

      t.timestamps
    end
  end
end
