class ChgCOlUsers2 < ActiveRecord::Migration
  def change
    remove_column :users, :is_instructor

  end
end
