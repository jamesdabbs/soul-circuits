class Playlist < ActiveRecord::Base
  belongs_to :user

  has_many :listens
  has_many :likes

  validates_presence_of :user, :title, :audio_url
end
