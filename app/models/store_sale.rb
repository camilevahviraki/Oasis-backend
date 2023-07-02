class StoreSale < ApplicationRecord
  before_create :set_access_token

  belongs_to :store, class_name: 'Store', foreign_key: 'store_id', validate: true
  belongs_to :item, class_name: 'Item', foreign_key: 'item_id'

  def self.added_this_week
    where(created_at: Time.zone.now.beginning_of_week..Time.zone.now.end_of_week).order(created_at: :desc)
  end

  def self.added_today
    where('DATE(created_at) = ?', Date.today).order(created_at: :desc)
  end

  def self.added_this_month
    where(created_at: Time.zone.now.beginning_of_month..Time.zone.now.end_of_month).order(created_at: :desc)
  end

  def self.added_last_month
    start_date = Date.today.beginning_of_month.prev_month
    end_date = Date.today.beginning_of_month - 1.day
    where(created_at: start_date.beginning_of_day..end_date.end_of_day).order(created_at: :desc)
  end

  def self.added_within_range(starting, ending)
    start_date = Date.parse(starting)
    end_date = Date.parse(ending)
    where(created_at: start_date.beginning_of_day..end_date.end_of_day).order(created_at: :desc)
  end

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
