class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.timestamps
    end

    add_reference :likes, :user, foreign_key: true
    add_reference :likes, :post, foreign_key: true
  end
end
