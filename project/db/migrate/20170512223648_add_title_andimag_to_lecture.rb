class AddTitleAndimagToLecture < ActiveRecord::Migration
  def change
    add_column :lectures , :image , :string
    add_column :lectures , :title , :string

  end
end
