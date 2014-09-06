class CreateListens < ActiveRecord::Migration
  def change
    create_table :listens do |t|
      t.integer :user_id
      t.integer :playlist_id

      t.timestamps
    end
  end
end
