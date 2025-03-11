class FriendshipsController < ApplicationController
  def create
    if is_current_user(params[:user_id]) && !is_current_user(params[:friend_id])
      @friendship = Friendship.new(user_id: params[:user_id], friend_id: params[:friend_id])
      friend = User.find(params[:friend_id])

      if @friendship.save
        flash[:notice] = "You are following #{friend.full_name}."
      else
        flash[:alert] = "You could not follow #{friend.full_name}."
      end
    else
      flash[:alert] = "You don't have sufficient permissions to perform this action."
    end

  redirect_to "/my_friends"
  end
  
  def destroy
    @friendship = Friendship.find(params[:id])

    if @friendship && is_current_user(@friendship.user_id)
      friend = User.find(@friendship.friend_id)
      @friendship.destroy
      flash[:notice] = "You have stopped following #{friend.full_name}."
    else
      flash[:alert] = "You don't have sufficient permissions to perform this action."
    end

  redirect_to "/my_friends"
  end
end
