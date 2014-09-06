require 'rails_helper'

describe PlaylistsController do
  render_views

  describe 'as a DJ' do
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

  describe 'as a Fan' do
    before :each do
      @fan = create :fan
      sign_in @fan
    end

    it 'lets users see playlists' do
      playlist = create :playlist
      get :show, id: playlist.id, format: :json

      expect( response.json.title ).to eq playlist.title
      expect( response.json.dj ).to eq playlist.user.username
      expect( response.json.likes ).to eq 0
    end

    it 'lets a user like a playlist' do
      playlist = create :playlist
      post :like, playlist_id: playlist.id, format: :json

      expect( response ).to redirect_to playlist_path(playlist)

      get :show, id: playlist.id, format: :json
      expect( response.json.likes ).to eq 1
    end
  end
end
