json.(@playlist, :title, :audio_url, :photo_url, :created_at, :updated_at)
json.likes @playlist.likes.count
json.dj @playlist.user.username
