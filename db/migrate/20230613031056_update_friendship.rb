class UpdateFriendship < ActiveRecord::Migration[7.0]
  def change
    add_reference :friendships, :user, foreign_key: true
  end
end
