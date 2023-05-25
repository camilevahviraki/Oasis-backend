require_relative 'modules/api_stores'
require_relative 'modules/update_store'

class Stores::StoresController < ApplicationController
  # before_action :authenticate_user!

  include ApiStore
  include UpdateStore
  def index
    @stores = Store.where(user_id: params[:user_id])
    render json: @stores, each_serializer: ApiStoresSerializer
  end

  def show
    @store = Store.find_by(token_id: params[:store_id])
    render json: @store, serializer: ApiStoresSerializer
  end

  def places
    stores = Store.all
    render json: stores, each_serializer: StorePlacesSerializer
  end

  def create
    @step = params[:step]
    case @step
    when '1'
      save_store_details
    when '2'
      save_store_categories
    when '3'
      save_store_pictures
    when '4'
      save_store_places
    else
      render json: { message: 'Missing or uncorrect step parameter!' }
    end
  end

  def update
    @field = params[:field]
    @store_id = params[:store_id]
    @new_value = params[:new_value]

    update_field(@store_id, @field, @new_value)
  end
end
