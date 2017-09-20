# frozen_string_literal: true
class Ability
  include CanCan::Ability

  def initialize(user, controller_namespace)
    user ||= User.new

    can :manage, :all if user.admin?

    case controller_namespace
      when 'dashboard'
        can :manage, Restaurant, user_id: user.id
      else
        can :manage, Order, user_id: user.id
        can :read, Restaurant
        can :read, Product
        can :read, Category
    end
  end
end