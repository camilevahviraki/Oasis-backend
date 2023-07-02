class HomePage::HomeController < ApplicationController
  def index
    page = 1
    data = Item.order("RANDOM()").limit(200)
    render json: data, each_serializer: ItemSerializer
  end

  def welcome_page
    category_names = StoreCategoriesList.pluck(:name)
    @items = Item.where(category_name: category_names).order("RANDOM()").limit(10)
    render json: @items, each_serializer: ItemSerializer
  end  

  def search
    query = params[:query]
    data = []

    if query == ''
      data = Item.all
    else
      data = Item.where(
        'lower(main_name) LIKE :search OR lower(category_name) LIKE :search OR lower(names) LIKE :search OR lower(description) LIKE :search ', search: "%#{query.downcase}%"
      )
    end
    render json: data, each_serializer: ItemSerializer
  end
end
