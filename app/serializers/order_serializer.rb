class OrderSerializer < ActiveModel::Serializer
  attributes :id, :order_destination, :created_at, :updated_at, :user_id, :token_id, :paid, :order_items
  def order_items
    list = []
    order_items = OrderItem.where(order_id: object.id)
    order_items.each do |order_item|
      list << OrderItemSerializer.new(order_item)
    end
    list
  end

  def order_destination
    JSON.parse(object.destination) if object.destination
  end
end
