class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :first_name
      t.string :last_name
      t.string :parents_name
      t.integer :user_id
      t.string :gender
      t.datetime :dob
      t.string :initial
      t.timestamps
    end
  end
end
