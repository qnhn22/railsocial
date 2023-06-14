class CreateCommentships < ActiveRecord::Migration[7.0]
  def change
    create_table :commentships do |t|

      t.timestamps
    end

    add_reference :commentships, :comment_child, null: false, foreign_key: {to_table: :comments}
    add_reference :commentships, :comment, foreign_key: true
  end
end
