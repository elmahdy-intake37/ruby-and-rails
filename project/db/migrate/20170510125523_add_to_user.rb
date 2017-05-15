class AddToUser < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :dob, :date
    add_column :users, :gender, :string
    add_column :users, :Ppicture, :text
    add_column :users, :instructor_id, :integer
  end
end
