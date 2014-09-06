require 'rails_helper'

describe PlaylistsController do
  render_views

  before :each do
    @dj = create :dj
    sign_in @dj
  end

  it 'allows djs to create playlists' do
    # TODO: this should be a file upload
    post :create, playlist: {
      title:     'New Playlist',
      audio_url: 'www.google.com'
    }, format: :json

    playlist = Playlist.last
    expect( playlist.user ).to eq @dj
    expect( playlist.title ).to eq 'New Playlist'
    expect( response ).to redirect_to playlist_path(playlist)
  end

  it "doesn't save invalid data" do
    post :create, playlist: { title: '' }, format: :json
    expect( Playlist.count ).to eq 0
    expect( response.json.errors ).to include "Title can't be blank"
  end
end
