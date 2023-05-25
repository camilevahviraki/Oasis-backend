class ItemMaterialsSerializer < ActiveModel::Serializer
  attributes :id, :name, :item_id, :image_url, :code, :material_id

  def image_url
    material_image = object.image
    material_image.attachment.url if material_image.attached?
  end
end
