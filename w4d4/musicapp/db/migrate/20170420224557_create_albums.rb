class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.integer :artist_id, null: false
      t.string :live, null: false
      t.string :title, null: false
      t.timestamps null: false
    end
  end
end
