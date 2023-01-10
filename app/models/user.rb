class User < ApplicationRecord
   has_many :stores, foreign_key: 'user_id', dependent: :destroy
   has_many :carts, foreign_key: 'user_id', dependent: :destroy
   has_many :orders, foreign_key: 'user_id', dependent: :destroy
end
