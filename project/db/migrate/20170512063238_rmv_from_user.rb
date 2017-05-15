class RmvFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :role
    remove_column :users, :Ppicture
    remove_column :users, :instructor_id
    end
end
