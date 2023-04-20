class Attributes::CapacitiesController < ApplicationController
    def index
        @capacities = CapacityUnit.all
        render json: @capacities
    end    
end    