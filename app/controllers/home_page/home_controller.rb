class HomePage::HomeController < ApplicationController
  def index
    # page=params[:page]
    page = 1
    # data = Item.all.paginate(page: page, per_page: 10)
    data = Item.all
    render json: data, each_serializer: ItemSerializer
  end

  def search
    query = params[:query]
    data = []

    if query == ''
      data = Item.all
    else
      data = Item.where(
        'lower(main_name) LIKE :search OR lower(names) LIKE :search OR lower(description) LIKE :search ', search: "%#{query.downcase}%"
      )
    end
    render json: data, each_serializer: ItemSerializer
  end
end
