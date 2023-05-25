class ApiStoresSerializer < ActiveModel::Serializer
  attributes :id, :name, :token_id, :country_id, :location, :country, :description, :user_id, :categories, :images_url, :main_image_url, :coordinate

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

  def images_url
    store_images = StoreImage.where(store_id: object.id)

    arr = []
    store_images.each do |store_image_single|
      store_image_single.pictures.attachments.each do |picture|
        arr << picture.url
      end
    end
    arr
  end
end
