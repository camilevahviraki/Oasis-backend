class ItemCapacitiesSerializer < ActiveModel::Serializer
    attributes :id, :name, :item_id, :image_url, :code, :capacity_unit_id, :value
  
    def image_url
      capacity_image = object.image
      if capacity_image.attached?
        capacity_image.attachment.url
      else
        nil
      end
    end  
end