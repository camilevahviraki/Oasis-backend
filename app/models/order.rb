require 'securerandom'

class Order < ApplicationRecord
  before_create :set_access_token
  # validates :token_id, uniqueness: true

  belongs_to :user, class_name: 'User', foreign_key: 'user_id', validate: true
  has_many :order_items, foreign_key: 'order_id', dependent: :destroy

  private

  def set_access_token
    # self.token_id = generate_token
    self.token_id = SecureRandom.hex(10)
  end

  def generate_token
    loop do
      self.token_id = SecureRandom.hex(10)
      break unless self.class.exists?(token_id:)
    end
  end
end
