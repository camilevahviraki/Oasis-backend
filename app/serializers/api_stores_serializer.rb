class ApiStoresSerializer < ActiveModel::Serializer
  
    attributes :id, :name, :country_id, :location, :country, :description, :user_id, :categories, :images_url,
  
    def categories
       StoreCategory.where(store_id: object.id)
    end  

    def images_url
      store_images = StoreImage.where(store_id: object.id)[0]
      arr = []
      if store_images
        store_images.pictures.attachments.each do |picture|
           arr << picture.url
        end
        return arr
      else
        images_url = []
      end  
    end
  
  end