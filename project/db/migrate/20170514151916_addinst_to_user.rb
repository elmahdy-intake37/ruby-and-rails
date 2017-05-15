class AddinstToUser < ActiveRecord::Migration
  def change
    add_column :users , :is_instructor , :integer

  end
end
