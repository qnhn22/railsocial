class RemoveIndexInComments < ActiveRecord::Migration[7.0]
  def change
    remove_index :comments, :parent_comment_id
  end
end
