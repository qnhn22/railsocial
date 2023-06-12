class InvitationsController < ApplicationController
    def new
        @not_friends = User.where.not(id: current_user.id) - current_user.friends - current_user.invitees
        @invitation = current_user.invitees.build
    end

    def create
        @invitation = current_user.invites.create(inviter_id: params[:inviter_id], invitee_id: params[:invitee_id])
        redirect_back fallback_location: new_invitation_path
    end

    def destroy
        @invitation = Invitation.find(params[:id])
        @invitation.destroy
        redirect_back fallback_location: new_invitation_path
    end
end
