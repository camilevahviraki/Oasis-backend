class StoreCategoriesListSerializer < ActiveModel::Serializer
  attributes :id, :name, :image_url, :icon

  def image_url
    return object.image.attachment.url if object.image.attached?

    nil
  end
end
