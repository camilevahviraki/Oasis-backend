class StoreCategoriesListSerializer < ActiveModel::Serializer
    attributes :id, :name, :image_url, :icon

    def image_url
      if object.image.attached?
        return object.image.attachment.url
      else
        return nil
      end
    end    
end