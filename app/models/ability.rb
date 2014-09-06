class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.dj?
      can :create, Playlist
    end

    can :read, Playlist
  end
end
