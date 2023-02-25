class CategoriesList::StoresCategoriesListController < ApplicationController
    def index
        render json: StoreCategoriesList.all
    end    
end    