class ItemSizesSerializer < ActiveModel::Serializer
    attributes :id, :name, :item_id, :image_url, :code, :size_id, :value
  
    def image_url
      size_image = object.image
      if size_image.attached?
        size_image.attachment.url
      else
        nil
      end
    end
end