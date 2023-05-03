class ItemSerializer < ActiveModel::Serializer
  attributes :id, :names, :main_name, :description, :store_id, :currency, :quantity, :updated_at, :created_at, :price,
             :items_images, :item_categories, :item_attributes

  def item_categories
    ItemCategory.where(item_id: object.id)
  end

  def item_attributes
    attributes_arr = []
    capacities = ItemCapacity.where(item_id: object.id)
    sizes = ItemSize.where(item_id: object.id)
    materials = ItemMaterial.where(item_id: object.id)
    colors = ItemColor.where(item_id: object.id)

    if(capacities.length > 0)
      cap_arr = []
      capacities.each do |cap|
        cap_arr << ItemCapacitiesSerializer.new(cap)
      end  
      attributes_arr << {title: 'Capacity', values: cap_arr}
    end

    if(sizes.length > 0)
      cap_arr = []
      sizes.each do |cap|
        cap_arr << ItemSizesSerializer.new(cap)
      end  
      attributes_arr << {title: 'Size', values: cap_arr}
    end

    if(colors.length > 0)
      cap_arr = []
      colors.each do |cap|
        cap_arr << ItemColorsSerializer.new(cap)
      end  
      attributes_arr << {title: 'Color', values: cap_arr}
    end

    if(materials.length > 0)
      cap_arr = []
      materials.each do |cap|
        cap_arr << ItemMaterialsSerializer.new(cap)
      end  
      attributes_arr << {title: 'Material', values: cap_arr}
    end
    return attributes_arr
  end  

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
