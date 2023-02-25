class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: JwtDenylist

  has_many :stores, foreign_key: 'user_id', dependent: :destroy
  has_many :carts, foreign_key: 'user_id', dependent: :destroy
  has_many :orders, foreign_key: 'user_id', dependent: :destroy

  has_one_attached :avatar

  def avatar_url
    avatar.attachment.url
  end
end
