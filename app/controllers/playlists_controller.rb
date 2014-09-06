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

private

  def create_params
    params.require(:playlist).permit(:title, :audio_url, :photo_url)
  end
end
