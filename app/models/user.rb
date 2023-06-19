class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :profile, dependent: :destroy
  has_many :posts, foreign_key: :author_id, dependent: :destroy

  has_many :likes, dependent: :destroy
  has_many :comments, foreign_key: :author_id, dependent: :destroy

  has_many :invites, class_name: "Invitation", foreign_key: :inviter_id, dependent: :destroy
  has_many :invitees, through: :invites

  has_many :received_invites, class_name: "Invitation", foreign_key: :invitee_id, dependent: :destroy
  has_many :inviters, through: :received_invites

  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships 

  def remove_friend(friend)
    self.friends.destroy(friend)
  end

  after_create :welcome_send

  def welcome_send
    WelcomeMailer.welcome_email(self).deliver_later
  end
end



