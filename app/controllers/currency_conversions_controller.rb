class CurrencyConversionsController < ApplicationController
  def search
    @currency_conversion = CurrencyConversion.fetch_and_create(params[:code], params[:codein])
    @currency_conversions = current_user.currency_conversion

    if !@currency_conversion
      flash[:alert] = "Please enter valid currency codes."
    end

    render "users/my_portfolio"
  end
end
