class Currencies::CurrenciesController < ApplicationController
  def index
    currencies = Currency.all
    render json: currencies
  end

  def show
    currency = Currency.find(params[:id])
    render json: currency
  end
end
