class FriendshipsController < ApplicationController
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
