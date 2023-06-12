class CreateFriendships < ActiveRecord::Migration[7.0]
  def change
    create_table :friendships do |t|
      t.timestamps
    end

    add_reference :friendships, :friend, null: false, foreign_key: {to_table: :users}
  end
end
