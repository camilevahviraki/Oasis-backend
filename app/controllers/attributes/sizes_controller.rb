class Attributes::SizesController < ApplicationController
  def index
    @sizes = Size.all
    render json: @sizes
  end

  def create
    size_data = params[:sizeData]
    if Size.create(size_data)
      render json: { message: 'Created Successfully' }
    else
      render json: { message: 'Error' }
    end
  end

  def update
    size_data = params[:sizeData]
    id = params[:id]
    size = Size.find(id)
    if size
      if size.update(size_data)
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
    size = Size.find(id)
    if size.destroy
      render json: { message: 'Deleted successfully' }
    else
      render json: { message: 'Error' }
    end
  end
end
