class AddAvatarInstrcToUsers < ActiveRecord::Migration
  def change
    add_column :users, :avatar, :string, :default => '/images/users/default.jpeg'
    add_column :users , :is_instructor , :boolean
  end
end
