class ChngUsers < ActiveRecord::Migration
  def change
    change_column_default :users , :instructor , :string

  end
end
