require 'stripe'
require_relative 'order_pay/order_pay'

class Orders::OrdersController < ApplicationController
  include OrderPay
  def index
    user_id = params[:user_id]
    orders = Order.where(user_id:)
    render json: orders, each_serializer: OrderSerializer
  end

  def show
    token_id = params[:token_id]
    order = Order.find_by(token_id:)
    render json: order, serializer: OrderSerializer
  end

  def create
    destination = params[:destination]
    user_id = params[:user_id]
    order_items = params[:order_items]

    order = Order.new(
      user_id:
    )

    if order.save
      order_items.each do |product|
        data = {
          price: product[:price],
          store_id: product[:store_id],
          item_id: product[:cart_item][:id],
          currency_id: Currency.all[0].id,
          exchange: product[:quantity],
          item_attributes: product[:item_attributes].to_json
        }
        order.order_items.create(data)
      end

      render json: { message: 'Order purachased successfully!', order_id: order.token_id, step: 1 }
    else
      render json: { message: 'Error while creating order!', step: 1 }
    end
  end

  def destination
    destination = params[:destination]
    token_id = params[:token_id]

    order = Order.find_by(token_id:)
    if order.update(destination: destination.to_json)
      render json: { message: 'Added destination successfully!', step: 2 }
    else
      render json: { message: 'Error while adding destination!', step: 1 }
    end
  end

  def delete; end

  def update; end
end
