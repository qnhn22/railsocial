class Invitation < ApplicationRecord
    belongs_to :inviter, class_name: "User"
    belongs_to :invitee, class_name: "User"

    validates :inviter, presence: true
    validates :invitee, presence: true

    def accept
        inviter.friends << invitee
        destroy
    end

    def reject
        destroy
    end
end
