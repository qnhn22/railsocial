class UpdateComments < ActiveRecord::Migration[7.0]
  def change
    add_reference :comments, :parent_comment, foreign_key: {to_table: :comments}
  end
end
