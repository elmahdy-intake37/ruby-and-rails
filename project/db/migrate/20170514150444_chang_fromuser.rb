class ChangFromuser < ActiveRecord::Migration
  def change
    change_column_default :users , :is_instructor , :integer

  end
end
