class UsersController < ApplicationController
  def my_portfolio
    @user = current_user
    @currency_conversions = current_user.currency_conversion
  end

  def my_friends
    @user = current_user
    @friends = current_user.friends
  end
end
