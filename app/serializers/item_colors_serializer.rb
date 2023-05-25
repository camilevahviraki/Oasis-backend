class ItemColorsSerializer < ActiveModel::Serializer
  attributes :id, :name, :hex_code, :item_id, :color_id, :image_url

  def image_url
    color_image = object.image
    color_image.attachment.url if color_image.attached?
  end
end
