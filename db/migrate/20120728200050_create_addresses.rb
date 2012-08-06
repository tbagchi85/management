class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.references :addressable, :polymorphic => true
      t.integer :user_id
      t.string :street_1
      t.string :street_2
      t.string :city
      t.string :state
      t.integer :pin_code
      t.string :country
      t.string :type
      t.timestamps
    end
  end
end
