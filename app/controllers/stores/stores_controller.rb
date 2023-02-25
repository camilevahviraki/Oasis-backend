require_relative 'modules/api_stores.rb'
require_relative 'modules/update_store.rb'

class Stores::StoresController < ApplicationController
    # before_action :authenticate_user!

    include ApiStore
    include UpdateStore
    def index
      @stores = Store.where(user_id: params[:user_id])
      render :json => @stores, each_serializer: ApiStoresSerializer
    end
    
    def show
      @store = Store.find(params[:store_id])
      render :json => @store, serializer: ApiStoresSerializer
    end
    
    def create
      @step = params[:step]
      if @step == '1'
        save_store_details
      elsif @step == '2'
        save_store_categories
      elsif @step == '3'
        save_store_pictures
      elsif @step == '4'
        save_store_places
      else
        render json: {message: 'Missing or uncorrect step parameter!'}
      end
    end  

    def update
      @field = params[:field]
      @store_id = params[:store_id]
      @new_value = params[:new_value]

      update_field(@store_id, @field, @new_value)
    end

end