class StorePlacesSerializer < ActiveModel::Serializer
    attributes :id, :name, :token_id, :country_id, :location, :country, :description, :categories, :main_image_url, :coordinate
  
    def coordinate
      if object.coordinates
        JSON.parse(object.coordinates)
      else
        nil
      end    
    end  
  
               def categories
                 StoreCategory.where(store_id: object.id)
               end
  
    def main_image_url
      if object.image.attached?
        object.image.attachment.url
      else
        nil
      end  
    end
  
  end