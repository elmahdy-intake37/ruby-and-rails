class ChgCOlUsersagin < ActiveRecord::Migration
  def change
    remove_column :users, :instructor

  end
end
