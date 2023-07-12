class Currencies::CurrenciesController < ApplicationController
  def index
    currencies = Currency.all
    render json: currencies
  end

  def show
    currency = Currency.find(params[:id])
    render json: currency
  end

  def create
    currency_data = params[:currencyData]
    name = currency_data[:name]
    exchange = currency_data[:exchange]
    symbole = currency_data[:symbole]
    country = currency_data[:country]
    if Currency.create(name:, exchange:, symbole:, country:)
      render json: { message: 'Created Successfully' }
    else
      render json: { message: 'Error' }
    end
  end
end
