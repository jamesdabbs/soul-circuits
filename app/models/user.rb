class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable

  has_many :identities

  has_many :listens
  has_many :likes

  has_many :playlists

  ROLES = %i( dj fan )
  validates :role, inclusion: { in: ROLES }

  def dj?
    role.to_s == "dj"
  end
end
