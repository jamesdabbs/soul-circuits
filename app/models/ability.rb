class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.dj?
      can :create, Playlist
      can :update, Playlist, user_id: user.id
    else
      can :like, Playlist
    end

    can :read, Playlist
  end
end
