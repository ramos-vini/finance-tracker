class UsersController < ApplicationController
  def my_portfolio
    @currency_conversions = current_user.currency_conversion
  end
end
