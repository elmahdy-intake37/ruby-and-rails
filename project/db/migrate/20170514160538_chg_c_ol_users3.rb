class ChgCOlUsers3 < ActiveRecord::Migration
  def change
    add_column :users, :instructor ,:integer

  end
end
