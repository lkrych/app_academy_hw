class EditUserIdLinks < ActiveRecord::Migration
  def change
    remove_column :links, :user_id
    add_column :links, :user_id, :integer
  end
end
