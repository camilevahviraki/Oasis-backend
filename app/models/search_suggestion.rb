class SearchSuggestion  < ApplicationRecord
    belongs_to :user, class_name: 'User', foreign_key: 'user_id', validate: true
    belongs_to :store, class_name: 'Store', foreign_key: 'store_id', validate: true
    belongs_to :item, class_name: 'Item', foreign_key: 'item_id', validate: true
end
