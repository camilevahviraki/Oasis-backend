require 'stripe'
# require_relative 'order_pay/order_pay'

class Orders::OrdersController < ApplicationController
  # include OrderPay
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
    params[:destination]
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

  def create_payment_intent
    payment_method_type = params[:paymentMethodType]
    currency = params[:currency]
    amount = data[:amount]
    order_token = params[:orderToken]
    payment_method_options = params[:paymentMethodOptions]

    @order = Order.find_by(token_id: order_token)

    data = {
      payment_method_types: payment_method_type == 'link' ? %w[link card] : [payment_method_type],
      amount:,
      currency:,
      payment_method_options:
    }

    if payment_method_type == 'acss_debit'
      data[:payment_method_options] = {
        acss_debit: {
          mandate_options: {
            payment_schedule: 'sporadic',
            transaction_type: 'personal'
          }
        }
      }
    end

    begin
      payment_intent = Stripe::PaymentIntent.create(data)
    rescue Stripe::StripeError => e
      render json: { error: { message: e } }
      return
    rescue StandardError => e
      render json: { error: { message: e } }
      return
    end

    @order.update(payment_intent: 'true')

    render json: { clientSecret: payment_intent.client_secret }
  end

  def confirm_payment
    token_id = params[:token_id]
    @order = Order.find_by(token_id:)
    if @order.update(payed: 'true')
      render json: { message: 'Payment confirmed successfully!' }
    else
      render json: { error: 'Couldnt confirm payment' }
    end
  end

  def webhook
    webhook_secret = ENV.fetch('STRIPE_WEBHOOK_SECRET', nil)
    payload = params
    if webhook_secret.empty?
      data = JSON.parse(payload, symbolize_names: true)
      event = Stripe::Event.construct_from(data)
    else
      sig_header = request.env['HTTP_STRIPE_SIGNATURE']
      event = nil

      begin
        event = Stripe::Webhook.construct_event(
          payload, sig_header, webhook_secret
        )
      rescue JSON::ParserError
        render json: { error: '⚠️  Webhook failed. Unexpected error' }
        return
      rescue Stripe::SignatureVerificationError
        render json: { error: '⚠️  Webhook signature verification failed.' }
        return
      end
    end

    if event.type == 'payment_intent.succeeded'
      event.data.object
      render json: { message: '💰 Payment received!' }
    end
    return unless event.type == 'payment_intent.payment_failed'

    event.data.object
    render json: { message: '❌ Payment failed.' }
  end
end
