class HomePage::HomeController < ApplicationController
  def index
    data = Item.all
    render json: data, each_serializer: ItemSerializer
  end
end
