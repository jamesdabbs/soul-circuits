class AddCountsToPlaylists < ActiveRecord::Migration
  def change
    add_column :playlists, :like_count, :integer
    add_column :playlists, :share_count, :integer
    add_column :playlists, :play_count, :integer
    add_column :playlists, :payout, :integer
  end
end
