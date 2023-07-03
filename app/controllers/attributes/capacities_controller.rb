class Attributes::CapacitiesController < ApplicationController
  def index
    @capacities = CapacityUnit.all
    render json: @capacities
  end

  def create
    capacity_data = params[:capacityData]
    if CapacityUnit.create(capacity_data)
      render json: {message: "Created Successfully"}
    else
      render json: {message: "Error"}
    end  
  end

  def update
    capacity_data = params[:capacityData]
    id = params[:id]
    capacity = CapacityUnit.find(id)
    if capacity
      if capacity.update(capacity_data)
        render json: {message: "Updated Successfully"}
      else
        render json: {message: "Could nt update"}
      end
    else
      render json: {message: "Error"}
    end 
  end

  def delete
    id = params[:id]
    capacity = CapacityUnit.find(id)
    if capacity.destroy
        render json: {message: "Deleted successfully"}
    else
      render json: {message: "Error"}
    end 
  end
end
