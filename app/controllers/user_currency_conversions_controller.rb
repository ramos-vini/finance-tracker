class UserCurrencyConversionsController < ApplicationController
  def create
    @user_currency_conversion = UserCurrencyConversion.new(user_id: params[:user_id],
                                  currency_conversion_id: params[:currency_conversion_id])

    currency_conversion_code = CurrencyConversion.find(params[:currency_conversion_id]).conversion_code
                                  
    if @user_currency_conversion.save
      flash[:notice] = "#{currency_conversion_code} was successfully added to Portfolio."
    else
      flash[:alert] = "#{currency_conversion_code} could not be added to Portfolio."
    end

    redirect_to "/my_portfolio", allow_other_host: true 
  end
end
