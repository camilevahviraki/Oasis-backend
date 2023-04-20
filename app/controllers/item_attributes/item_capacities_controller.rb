class ItemAttributes::ItemCapacitiesController < ApplicationController
    def index
     @item_capacities = ItemCapacity.where(item_id: params[:item_id])
     render json: @item_capacities, each_serializer: ItemCapacitiesSerializer
    end
    
    def create
     name = params[:name]
     code = params[:code]
     item_id = params[:item_id]
     capacity_unit_id = params[:capacity_unit_id]
     value = params[:value]
 
     new_capacity = ItemCapacity.new(
         name: name,
         code: code,
         item_id: item_id,
         capacity_unit_id: capacity_unit_id,
         value: value,
     )
 
     if new_capacity.save
         render json: {message: 'capacity assigned successfully'}
     else
         render json: {message: 'Error while assigning a capacity to Item'}
     end
    end

    def update
        id = params[:id]
        image = params[:image]
        @item_capacity = ItemCapacity.find(id)
        @item_capacity.image.attach(image)

      if @item_capacity.image.attached?
        render json: { message: 'Image assigned sucessfully', id: @item_capacity.id }
      else
        render json: { message: 'Error while attaching Image', id: @item_capacity.id }
      end
    end    
 
    def delete
     item_capacity = ItemCapacity.find(params[:id])
 
     if item_capacity.delete
        render json: {message: 'capacity deleted successfully'}
     else
        render json: {message: 'Error while deleting a capacity'}
     end        
    end
    
 end