class CreateCommentsStore < ActiveRecord::Migration[7.0]
  def change
    create_table :comments_stores do |t|
      t.string 'text'

      t.timestamps
    end
  end
end
