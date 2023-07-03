class Countries::CountriesController < ApplicationController
  def index
    countries = Country.all
    render json: countries, each_serializer: CountriesSerializer
  end

  def create
    country_data = params[:countryData]
    if Country.create(country_data)
      render json: {message: "Created Successfully"}
    else
      render json: {message: "Error"}
    end  
  end

  def update
    country_data = params[:countryData]
    id = params[:id]
    country = Country.find(id)
    if country
      if country.update(country_data)
        render json: {message: "Updated Successfully"}
      else
        render json: {message: "Could nt update"}
      end
    else
      render json: {message: "Error"}
    end 
  end

  def delete
    id = params[:id]
    country = Country.find(id)
    if country.destroy
        render json: {message: "Deleted successfully"}
    else
      render json: {message: "Error"}
    end 
  end
end
