class Attributes::MaterialsController < ApplicationController
  def index
    @materials = Material.all
    render json: @materials
  end

  def create
    material_data = params[:materialData]
    if Material.create(material_data)
      render json: { message: 'Created Successfully' }
    else
      render json: { message: 'Error' }
    end
  end

  def update
    material_data = params[:materialData]
    id = params[:id]
    material = Material.find(id)
    if material
      if material.update(material_data)
        render json: { message: 'Updated Successfully' }
      else
        render json: { message: 'Could nt update' }
      end
    else
      render json: { message: 'Error' }
    end
  end

  def delete
    id = params[:id]
    material = Material.find(id)
    if material.destroy
      render json: { message: 'Deleted successfully' }
    else
      render json: { message: 'Error' }
    end
  end
end
