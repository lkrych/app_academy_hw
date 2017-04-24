class CreatePostsubs < ActiveRecord::Migration
  def change
    create_table :postsubs do |t|
      t.integer :sub_id
      t.integer :post_id

      t.timestamps null: false
    end
    add_index :postsubs, [:sub_id, :post_id]
  end
end
