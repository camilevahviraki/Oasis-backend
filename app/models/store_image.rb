class StoreImage < ApplicationRecord
  belongs_to :store, class_name: 'Store', foreign_key: 'store_id', validate: true

  has_many_attached :pictures
end
