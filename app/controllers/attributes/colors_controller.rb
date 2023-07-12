class Attributes::ColorsController < ApplicationController
  def index
    @colors = Color.all
    render json: @colors
  end

  def create
    color_data = params[:colorData]
    name = color_data[:name]
    hex_code = color_data[:hex_code]

    if Color.create(name:, hex_code:)
      render json: { message: 'Created Successfully' }
    else
      render json: { message: 'Error' }
    end
  end

  def update
    color_data = params[:colorData]
    id = params[:id]
    color = Color.find(id)
    if color
      if color.update(color_data)
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
    color = Color.find(id)
    if color.destroy
      render json: { message: 'Deleted successfully' }
    else
      render json: { message: 'Error' }
    end
  end
end
