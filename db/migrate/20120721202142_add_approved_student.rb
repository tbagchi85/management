class AddApprovedStudent < ActiveRecord::Migration
  def up
    add_column :students, :approved, :boolean, :default => false
    add_column :students, :user_id, :integer
  end

  def down
    remove_column :students, :approved
    remove_column :students, :user_id
  end
end
