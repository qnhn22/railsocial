class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.text :body
      t.timestamps
    end

    add_reference :comments, :author, null: false, foreign_key: {to_table: :users}
    add_reference :comments, :post, null: false, foreign_key: true
  end
end
