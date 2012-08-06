class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.integer :standard
      t.string :section, :default => 'A'
      t.integer :count, :default => '0'
      t.string :key_id
      t.string :key_token

      t.timestamps
    end
  end
end
