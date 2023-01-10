class CreateCommentsStoreReply < ActiveRecord::Migration[7.0]
  def change
    create_table :comments_store_replies do |t|
      t.text 'comment'

      t.timestamps
    end
  end
end
