# Authorization
class Ability
  include CanCan::Ability

  # original
  # def initialize(user)
    # user ||= User.new # guest user (not logged in) means assign User.new to user if user is null
    # can :manage, User, id: user.id
  # end

  # admin role & del user comments
  # doesn't work though, a user can still delete a comment
  def initialize(user)
    user ||= User.new # guest user (not logged in) means assign User.new to user if user is null
    if user.admin?
    	can :manage, :all
    else
    	can :manage, User, id: user.id
    end
  end

end
