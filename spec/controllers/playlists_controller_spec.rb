require 'rails_helper'

describe PlaylistsController do
  render_views

  it 'allows djs to create playlists' do
    dj = create :dj
    sign_in dj

    # TODO: this should be a file upload
    post :create, playlist: {
      title:     'New Playlist',
      audio_url: 'www.google.com'
    }, format: :json

    playlist = Playlist.last
    expect( playlist.title ).to eq 'New Playlist'
    expect( response ).to redirect_to playlist_path(playlist)
  end
end
