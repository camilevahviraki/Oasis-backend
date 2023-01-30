require 'modules/api_stores.rb'

class ApiStoresController < ApplicationController
    # before_action :authenticate_user!

    include ApiStore
    def index
      @stores = Store.where(user_id: 1)
      render :json => @stores, each_serializer: ApiStoresSerializer
    end
    
    def show
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

end