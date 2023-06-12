class Item < ApplicationRecord
  before_create :set_access_token
  # self.per_page = 10
  # searchkick

  belongs_to :store, class_name: 'Store', foreign_key: 'store_id', validate: true
  has_many :item_categories, foreign_key: 'item_id', dependent: :destroy
  has_many :item_images, foreign_key: 'item_id', dependent: :destroy
  has_many :item_capacities, foreign_key: 'item_id', dependent: :destroy
  has_many :item_sizes, foreign_key: 'item_id', dependent: :destroy
  has_many :item_colors, foreign_key: 'item_id', dependent: :destroy
  has_many :item_materials, foreign_key: 'item_id', dependent: :destroy
  has_many :carts, foreign_key: 'item_id', dependent: :destroy
  has_many :order_items, foreign_key: 'item_id', dependent: :destroy
  has_many :search_suggestion, foreign_key: 'item_id', dependent: :destroy

  private

  def set_access_token
    # self.token_id = generate_token
    self.token_id = SecureRandom.hex(10)
  end

  def generate_token
    #   loop do
    #     token = SecureRandom.hex(10)
    #     break token unless Order.where(token_id: token).exists?
    #   end

    loop do
      self.token_id = SecureRandom.hex(10)
      break unless self.class.exists?(token_id:)
    end
  end
end
