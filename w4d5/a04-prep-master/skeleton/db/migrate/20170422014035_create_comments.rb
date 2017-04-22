class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body, null: false
      t.integer :user_id, null: false
      t.integer :link_id, null: false
      t.string :user, null: false
      t.string :link, null: false
      t.timestamps null: false
    end
  end
end
