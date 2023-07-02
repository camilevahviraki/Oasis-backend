class AddUserRfToSearchSuggestions < ActiveRecord::Migration[7.0]
  def change
    add_reference :search_suggestions, :user, foreign_key: true
  end
end
