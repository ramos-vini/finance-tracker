class CurrencyConversionsController < ApplicationController
  def search
    @currency_conversion = CurrencyConversion.fetch_and_create(params[:code], params[:codein])
    render "users/my_portfolio"
  end
end
