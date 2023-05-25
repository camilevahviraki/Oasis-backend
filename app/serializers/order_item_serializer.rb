class OrderItemSerializer < ActiveModel::Serializer
  attributes :id, :exchange, :store_id, :item, :price, :attributes_item

  def item
    item = Item.find(object.item_id)
    SimpleItemSerializer.new(item)
  end

  def attributes_item
    JSON.parse(object.item_attributes)
  end
end
