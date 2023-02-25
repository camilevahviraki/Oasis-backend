class Item < ApplicationRecord
    belongs_to :store, :class_name => 'Store', :foreign_key => 'store_id', :validate => true
    has_many :item_categories, foreign_key: 'item_id', dependent: :destroy
    has_many :item_images, foreign_key: 'item_id', dependent: :destroy
    # has_many_attached :pictures
end