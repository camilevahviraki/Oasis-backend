class Store < ApplicationRecord
    belongs_to :user, :class_name => 'User', :foreign_key => 'user_id', :validate => true
    has_many :comments_stores, foreign_key: 'store_id', dependent: :destroy
    has_many :cart_items, foreign_key: 'store_id', dependent: :destroy
    has_many :items, foreign_key: 'store_id', dependent: :destroy
    has_many :likes_stores, foreign_key: 'store_id', dependent: :destroy
    has_many :order_items, foreign_key: 'store_id', dependent: :destroy
    has_many :places, foreign_key: 'store_id', dependent: :destroy
    has_many :store_categories, foreign_key: 'store_id', dependent: :destroy
    has_many :store_images, foreign_key: 'store_id', dependent: :destroy
end
