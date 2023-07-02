require 'stripe'

Stripe.api_key = 'sk_test_51MvQIxCAdTB9DdU7qONKowMEa7shHYb6ei3LerniRt21uETvOPeWN07YROEQjh9UvyrlYAhRaATrdUTcuu5Rzkip00LI2HSFh3'

module OrderPay
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
