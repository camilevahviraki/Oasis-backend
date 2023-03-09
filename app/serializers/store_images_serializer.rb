class StoreImagesSerializer < ActiveModel::Serializer
  attributes :id, :description, :store_id, :pictures_data,
             def pictures_data
               arr = []
               object.pictures.attachments.each do |picture|
                 arr << { url: picture.url, image_data: picture }
               end
               arr
             end
end
