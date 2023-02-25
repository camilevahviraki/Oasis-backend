class ItemCategory < ApplicationRecord
  belongs_to :item, class_name: 'Item', foreign_key: 'item_id', validate: true
  belongs_to :item_categories_list, class_name: 'ItemCategoriesList', foreign_key: 'item_categories_list_id',
                                    validate: true
end
