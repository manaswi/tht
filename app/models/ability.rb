class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.admin?
      can :manage, :all
    else
      can :read, Recipe
      can :manage, User, :user_id => user.id
      can :manage, Recipe, :user_id => user.id
      #can :manage, Comment, :user_id => user.id
    end
  end
end