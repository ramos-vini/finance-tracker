class UserCurrencyConversionsController < ApplicationController
  # TODO: Check for current_user permissions
  def create
    user = User.find(params[:user_id])
    currency_conversion = CurrencyConversion.find(params[:currency_conversion_id])

    if user.currency_conversion.count < 10
      @user_currency_conversion = UserCurrencyConversion.new(user_id: params[:user_id],
                                    currency_conversion_id: params[:currency_conversion_id])

      currency_conversion_code = currency_conversion.conversion_code
                                    
      if @user_currency_conversion.save
        flash[:notice] = "#{currency_conversion_code} was added to your Portfolio."
      else
        flash[:alert] = "#{currency_conversion_code} could not be added to your Portfolio."
      end
    else
      flash[:alert] = "You can only track up to 10 Currency Conversions."
    end

    redirect_to "/my_portfolio", allow_other_host: true 
  end

  def destroy
    @user_currency_conversion = UserCurrencyConversion.find(params[:id])

    if @user_currency_conversion
      currency_conversion = CurrencyConversion.find(@user_currency_conversion.currency_conversion_id)

      @user_currency_conversion.destroy
      flash[:notice] = "#{currency_conversion.conversion_code} was removed from your Portfolio."
      redirect_to "/my_portfolio"
    end
  end
end
