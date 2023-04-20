class ItemMaterialsSerializer < ActiveModel::Serializer
    attributes :id, :name, :item_id, :image_url, :code, :material_id
  
    def image_url
      material_image = object.image
      if material_image.attached?
        material_image.attachment.url
      else
        nil
      end
    end
end