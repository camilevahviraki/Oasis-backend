class Stores::StoreImagesController < ApplicationController
  def index
    store_id = params[:store_id]
    @store_images = StoreImage.where(store_id:)

    render json: @store_images, each_serializer: StoreImagesSerializer
  end

  def show
    id = params[:id]
    @store_image = StoreImage.find(id:)

    render json: @store_image, serializer: StoreImagesSerializer
  end

  def delete
    @image = ActiveStorage::Attachment.find(params[:id])
    if @image.purge
      render json: { message: 'Image deleted successfully' }
    else
      render json: { message: 'Error while deleting image' }
    end
  end
end
