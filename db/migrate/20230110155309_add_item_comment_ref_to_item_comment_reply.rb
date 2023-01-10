class AddItemCommentRefToItemCommentReply < ActiveRecord::Migration[7.0]
  def change
    add_reference :item_comment_replies, :item_comment, foreign_key: true
  end
end
