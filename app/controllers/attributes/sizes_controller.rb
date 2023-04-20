class Attributes::SizesController < ApplicationController
    def index
        @sizes = Size.all
        render json: @sizes
    end    
end    