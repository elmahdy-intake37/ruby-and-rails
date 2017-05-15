class ModifyAvatarFiled < ActiveRecord::Migration
  def change
    change_column_default :users, :avatar,'default.jpeg'

  end
end
