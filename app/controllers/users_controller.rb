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
    if !@user
      flash[:alert] = "You don't have enough permission to perform this action."
      redirect_to my_friends_path, allow_other_host: true
    else
      @currency_conversions = @user.currency_conversion
    end
  end

  def search
    @user = current_user
    @friends = @user.friends

    pattern = "%#{params[:query]}%"
    @searched_users = User.where("first_name LIKE ? OR last_name LIKE ? OR email LIKE ?", pattern, pattern, pattern).paginate(page: params[:page], per_page: 10)
    render "users/my_friends"
  end
end
