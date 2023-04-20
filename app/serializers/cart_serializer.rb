class CartSerializer < ActiveModel::Serializer
    attributes :id, :price, :quantity, :store_id, :item_id, :attributes, :cart_item

    def cart_item
        item = Item.where(id: object.item_id)[0]
        return SimpleItemSerializer.new(item)
    end    

    def attributes
        attributes_arr = []
        capacities = ItemCapacity.where(item_id: object.item_capacity_id)
        sizes = ItemSize.where(item_id: object.item_material_id)
        materials = ItemMaterial.where(item_id: object.item_size_id)
        colors = ItemColor.where(item_id: object.item_color_id)
    
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
end    