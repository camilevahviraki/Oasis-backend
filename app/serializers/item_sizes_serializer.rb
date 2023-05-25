class ItemSizesSerializer < ActiveModel::Serializer
  attributes :id, :name, :item_id, :image_url, :code, :size_id, :value

  def image_url
    size_image = object.image
    size_image.attachment.url if size_image.attached?
  end
end
