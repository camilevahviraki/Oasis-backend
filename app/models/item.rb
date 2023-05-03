class Item < ApplicationRecord
  
  # self.per_page = 10
  searchkick

  belongs_to :store, class_name: 'Store', foreign_key: 'store_id', validate: true
  has_many :item_categories, foreign_key: 'item_id', dependent: :destroy
  has_many :item_images, foreign_key: 'item_id', dependent: :destroy
  has_many :item_capacities, foreign_key: 'item_id', dependent: :destroy
  has_many :item_sizes, foreign_key: 'item_id', dependent: :destroy
  has_many :item_colors, foreign_key: 'item_id', dependent: :destroy
  has_many :item_materials, foreign_key: 'item_id', dependent: :destroy
  has_many :carts, foreign_key: 'item_id', dependent: :destroy
  has_many :search_suggestion, foreign_key: 'user_id', dependent: :destroy
end
