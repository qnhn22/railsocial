class CreateInvitations < ActiveRecord::Migration[7.0]
  def change
    create_table :invitations do |t|
      t.timestamps
    end

    add_reference :invitations, :inviter, null: false, foreign_key: {to_table: :users}
    add_reference :invitations, :invitee, null: false, foreign_key: {to_table: :users}
  end
end
