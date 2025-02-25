class UserCurrencyConversionsController < ApplicationController
  def create
    @user_currency_conversion = UserCurrencyConversion.new(user_id: params[:user_id],
                                  currency_conversion_id: params[:currency_conversion_id])

    if @user_currency_conversion.save
      flash[:notice] = "Currency Conversion was successfully added to Portfolio."
    else
      flash[:alert] = "Currency Conversion could not be added to Portfolio."
    end

    redirect_to "/my_portfolio", allow_other_host: true 
  end
end
