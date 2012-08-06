class AddApprovedToUser < ActiveRecord::Migration
  def up
    add_column :users, :approved, :boolean, :default => false
  end

  def down
    remove_column :users, :approved
  end
end
