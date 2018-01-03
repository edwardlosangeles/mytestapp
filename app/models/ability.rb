# Authorization
class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in) means assign User.new to user if user is null
    can :manage, User, id: user.id
  end

end
