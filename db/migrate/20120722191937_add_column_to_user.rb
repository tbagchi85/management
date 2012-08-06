class AddColumnToUser < ActiveRecord::Migration
  def up
    add_column :users, :user_student, :boolean, :default => false
    add_column :users, :user_admin, :boolean, :default => false
    add_column :users, :user_teacher, :boolean, :default => false
    add_column :users, :user_parents, :boolean, :default => false
  end

  def down
    remove_column :users, :user_student
    remove_column :users, :user_admin
    remove_column :users, :user_teacher
    remove_column :users, :user_parents
  end
end
