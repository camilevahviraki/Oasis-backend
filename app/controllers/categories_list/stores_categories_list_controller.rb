class CategoriesList::StoresCategoriesListController < ApplicationController
  def index
    render json: StoreCategoriesList.all, each_serializer: StoreCategoriesListSerializer
  end

  def create
    name = params[:name]
    icon = params[:icon]
    image = params[:icon]

    category = StoreCategoriesList.new(:name)

    if category.save
      if image
        category.attach(:image)
        render json: {message: 'Store categoery type created successfully with image.'}
      else
        render json: {message: 'Store categoery type created successfully.'}
      end   
    else
      render json: {message: 'Error creating store category list.'}
    end
  end  

  def attach_image
    image = params[:image]
    id = params[:id]

    category = StoreCategoriesList.find(id)

    if category
      category.attach(:image)
      render json: {message: 'Image attached successfully.'}
    else
      render json: {message: "Could not find Store Category with id: #{id}"}
    end    
  end  
end
