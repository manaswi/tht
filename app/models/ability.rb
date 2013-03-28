class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.admin?
      can :manage, :all
    else
      can :read, :all #[Recipe, User, Comment]
      can :manage, User, :id => user.id
      can :manage, [Recipe, Comment, Relation, Thought], :user_id => user.id
      can :manage, StepSummary
      # can :manage, Comment, :user_id => user.id
      # can :manage, Relation, :user_id => user.id
    end
  end
end