class CreatePlaylists < ActiveRecord::Migration
  def change
    create_table :playlists do |t|
      t.integer :user_id
      t.string :title
      t.string :audio_url
      t.string :photo_url

      t.timestamps
    end
  end
end
