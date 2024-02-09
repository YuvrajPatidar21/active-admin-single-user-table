# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    def initialize(user)
      user ||= User.new
  
      cannot :manage, Article
      if user.has_role? :admin
        can :manage, :all
      elsif user.has_role? :author
        can :manage, Article, user_id: user.id
      elsif user.has_role? :user
        can :manage, Article, user_id: user.id
      end
    end
  end
end
