class ApiStoresSerializer < ActiveModel::Serializer
  attributes :id, :name, :country_id, :location, :country, :description, :user_id, :categories, :images_url,
             def categories
               StoreCategory.where(store_id: object.id)
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
