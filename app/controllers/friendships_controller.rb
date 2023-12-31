class FriendshipsController < ApplicationController
    def create
        @friendship = current_user.friendships.create(friend_id: params[:friend_id])
        @invitation = current_user.received_invites.find_by(inviter_id: params[:friend_id])

        @invitation.destroy
        redirect_to root_path
    end

    def destroy
        @friendship = Friendship.find(params[:id])
        @friendship.destroy

        redirect_to root_path
    end
end
