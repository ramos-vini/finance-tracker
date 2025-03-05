class UsersController < ApplicationController
  def my_portfolio
    @user = current_user
    @currency_conversions = @user.currency_conversion
  end

  def my_friends
    @user = current_user
    @friends = @user.friends
  end

  def portfolio
    @user = User.find_by(id: params[:id])
    if !(@user && is_current_user_friend(@user.id))
      flash[:alert] = "You can only see your friends' portfolios."
      redirect_to "/my_portfolio", allow_other_host: true
    end
    @currency_conversions = @user.currency_conversion
  end
end
