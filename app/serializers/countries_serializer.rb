class CountriesSerializer < ActiveModel::Serializer
    attributes :id, :name, :postal_code, :country_code, :currency_name, :exchange, :latitude, :longitude
end