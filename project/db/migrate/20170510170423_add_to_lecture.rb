class AddToLecture < ActiveRecord::Migration
  def change
    add_column :lectures, :attachment, :string

  end
end
