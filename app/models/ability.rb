# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.admin?
        can :manage, :all
    else
        can :create, Payment
        can :read, Payment
        can :show, Payment
        can :create, User
        can :read, User, :id => user.id
        can :update, User, :id => user.id
    end


    
  end
end
