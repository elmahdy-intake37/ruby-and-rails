class Changecolformuser < ActiveRecord::Migration
  def change
    change_column_default :users , :is_instructor , :boolean

  end
end
