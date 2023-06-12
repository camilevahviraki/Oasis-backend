class StorePlacesSerializer < ActiveModel::Serializer
  attributes :id, :name, :token_id, :country_id, :location, :country, :description, :categories, :main_image_url,
             :coordinate

  def coordinate
    JSON.parse(object.coordinates) if object.coordinates
  end

  def categories
    StoreCategory.where(store_id: object.id)
  end

  def main_image_url
    object.image.attachment.url if object.image.attached?
  end
end
