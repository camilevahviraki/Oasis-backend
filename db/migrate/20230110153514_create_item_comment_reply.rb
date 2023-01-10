class CreateItemCommentReply < ActiveRecord::Migration[7.0]
  def change
    create_table :item_comment_replies do |t|
      t.text 'comment'

      t.timestamps
    end
  end
end
