class ChgCOlUsers < ActiveRecord::Migration
  def change
    remove_column :users, :is_instructor

  end
end
