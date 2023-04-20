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
    if @image
      if @image.purge
        render json: { message: 'Image deleted successfully' }
      else
        render json: { message: 'Error while deleting image' }
      end
    else
      render json: { message: 'Couldn\'t find image!' }
    end    
  end

  def create
    store_id = params[:store_id]
    @store = Store.find(store_id)

    if @store
      @store_image = StoreImage.create(store_id: store_id)
      @store_image.pictures.attach(params[:images])
    
      if @store_image.pictures.attached?
        render json: { message: 'Images uploaded successfully' }
      else
        render json: { message: 'Creation failed, Please check your params!' }
      end
    else
      render json: { message: 'Couldn\'t find store!' }
    end  
  end  
end
