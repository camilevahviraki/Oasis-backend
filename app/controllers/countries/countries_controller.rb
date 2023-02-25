class Countries::CountriesController < ApplicationController
  def index
    countries = Country.all
    render json: countries, each_serializer: CountriesSerializer
  end
end
