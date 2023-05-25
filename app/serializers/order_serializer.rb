class OrderSerializer < ActiveModel::Serializer
    attributes :id, :order_destination, :created_at, :updated_at, :user_id, :token_id, :paid, :order_items
            def order_items
                list = []
                order_items = OrderItem.where(order_id: object.id)
                order_items.each do |order_item|
                    list << OrderItemSerializer.new(order_item)
                end    
                return list
            end

            def order_destination
               if object.destination
                  return JSON.parse(object.destination)
               else
                  return nil
               end  
            end    
  
  end
  