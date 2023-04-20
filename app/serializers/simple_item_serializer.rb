class SimpleItemSerializer < ActiveModel::Serializer
    attributes :id, :mainName, :description, :store_id, :currency, :quantity, :price,
               :items_images,  
  
    def items_images
      images = ItemImage.where(item_id: object.id)[0]
      arr = []
      if images
        images.pictures.attachments.each do |picture|
          arr << picture.url
        end
        arr
      else
        []
      end
    end
  end