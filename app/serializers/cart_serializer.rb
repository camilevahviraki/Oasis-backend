class CartSerializer < ActiveModel::Serializer
    attributes :id, :price, :quantity, :store_id, :item_id, :cart_item, :item_attributes
    def cart_item
        item = Item.where(id: object.item_id)[0]
        return SimpleItemSerializer.new(item)
    end    

    def item_attributes
        attributes_arr = []
        capacities = nil
        sizes = nil
        color = nil
        materials = nil
        if object.item_capacity_id 
          capacities = ItemCapacity.find(object.item_capacity_id)
        end
        if object.item_material_id
          materials = ItemMaterial.find(object.item_material_id)
        end
        if object.item_size_id
          sizes = ItemSize.find(object.item_size_id)
        end
        if object.item_color_id
          colors = ItemColor.find(object.item_color_id)
        end
        if(capacities)
          cap_arr = ItemCapacitiesSerializer.new(capacities)
          attributes_arr << {title: 'Capacity', values: cap_arr}
        end
    
        if(sizes)
          cap_arr = ItemSizesSerializer.new(sizes)
          attributes_arr << {title: 'Size', values: cap_arr}
        end
    
        if(colors)
          cap_arr = ItemColorsSerializer.new(colors)
          attributes_arr << {title: 'Color', values: cap_arr}
        end
    
        if(materials)
          cap_arr = ItemMaterialsSerializer.new(materials)
          attributes_arr << {title: 'Material', values: cap_arr}
        end
        return attributes_arr
      end  
end    