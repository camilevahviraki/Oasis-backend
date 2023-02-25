class ItemSerializer < ActiveModel::Serializer
  attributes :id, :names, :mainName, :description, :store_id, :currency, :quantity, :updated_at, :created_at, :price,
             :items_images, :item_categories

  def item_categories
    ItemCategory.where(item_id: object.id)
  end

  def items_images
    images = ItemImage.where(item_id: object.id)[0]
    arr = []
    if images
      images.pictures.attachments.each do |picture|
        arr << picture.url
      end
      arr
    else
      []
    end
  end
end
