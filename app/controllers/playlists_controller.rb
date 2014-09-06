class PlaylistsController < ApplicationController
  def create
    @playlist = current_user.playlists.new create_params
    authorize! :create, @playlist
    if @playlist.save
      redirect_to @playlist
    else
      respond_to do |format|
        format.html { render :new }
        format.json { render_invalid @playlist }
      end
    end
  end

  def show
    @playlist = Playlist.find params[:id]
    authorize! :read, @playlist
  end

  def like
    @playlist = Playlist.find params[:playlist_id]
    authorize! :like, @playlist
    current_user.likes.where(playlist: @playlist).first_or_create!
    redirect_to @playlist
  end

private

  def create_params
    params.require(:playlist).permit(:title, :audio_url, :photo_url)
  end
end
