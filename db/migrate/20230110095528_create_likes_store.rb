class CreateLikesStore < ActiveRecord::Migration[7.0]
  def change
    create_table :likes_stores do |t|
      t.integer 'stars'

      t.timestamps
    end
  end
end
