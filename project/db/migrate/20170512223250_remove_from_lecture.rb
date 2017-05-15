class RemoveFromLecture < ActiveRecord::Migration
  def change
      remove_column :lectures, :attchment
  end
end
