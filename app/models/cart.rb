class Cart < ApplicationRecord
    belongs_to :user, :class_name => 'User', :foreign_key => 'user_id', :validate => true
    has_many :cart_items, foreign_key: 'cart_id', dependent: :destroy
end
