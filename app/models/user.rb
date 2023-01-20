class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: JwtDenylist
   
  has_many :stores, foreign_key: 'user_id', dependent: :destroy
  has_many :carts, foreign_key: 'user_id', dependent: :destroy
  has_many :orders, foreign_key: 'user_id', dependent: :destroy
end
