class Playlist < ActiveRecord::Base
  belongs_to :user

  has_many :listens
  has_many :likes
end
