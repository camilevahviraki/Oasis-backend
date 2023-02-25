class City < ApplicationRecord
  belongs_to :country, class_name: 'Country', foreign_key: 'country_id', validate: true
end
