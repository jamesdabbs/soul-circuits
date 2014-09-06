class PlaylistsController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  skip_authorization_check only: [:sign]

  def new
    @playlist = current_user.playlists.new
    authorize! :create, @playlist
  end

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

  def sign
    objectName = "#{current_user.username}-#{params[:s3_object_name]}-#{Time.now.to_i}".gsub(/\s+/, '-')
    mimeType   = params[:s3_object_type]
    expires    = Time.now.to_i + 100

    amzHeaders = "x-amz-acl:public-read"
    stringToSign = "PUT\n\n#{mimeType}\n#{expires}\n#{amzHeaders}\n/#{S3_BUCKET_NAME}/#{objectName}"
    sig = CGI::escape Base64.strict_encode64 OpenSSL::HMAC.digest('sha1', S3_SECRET_KEY, stringToSign)

    render json: {
      signed_request: CGI::escape("http://s3.amazonaws.com/#{S3_BUCKET_NAME}/#{objectName}?AWSAccessKeyId=#{S3_ACCESS_KEY}&Expires=#{expires}&Signature=#{sig}"),
      url: "http://s3.amazonaws.com/#{S3_BUCKET_NAME}/#{objectName}"
    }
  end

private

  def create_params
    params.require(:playlist).permit(:title, :audio_url, :photo_url)
  end
end
