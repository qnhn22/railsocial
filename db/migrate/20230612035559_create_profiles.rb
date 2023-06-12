class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.string :name
      t.string :gender
      t.date :birth
      t.string :location
      t.references :user, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
