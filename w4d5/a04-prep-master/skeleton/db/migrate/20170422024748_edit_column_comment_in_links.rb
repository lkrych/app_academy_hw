class EditColumnCommentInLinks < ActiveRecord::Migration
  def change
    remove_column :links, :comment
    add_column :links, :comment, :string
  end
end
