class AddStoreReferenceToSerachSuggestions < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :search_suggestion, foreign_key: true
    add_reference :stores, :search_suggestion, foreign_key: true
    add_reference :items, :search_suggestion, foreign_key: true
  end
end
