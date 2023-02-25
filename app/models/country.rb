class Country < ApplicationRecord
  has_many :cities, foreign_key: 'country_id'
  has_many :stores, foreign_key: 'country_id'
  has_many :users, foreign_key: 'country_id'
end
