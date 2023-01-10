class AddUserRefToStore < ActiveRecord::Migration[7.0]
  def change
    add_reference :stores, :user, foreign_key: true
  end
end
