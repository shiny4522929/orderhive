# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    # can :manage, :all if user.admin?
    user ||= User.new
    # binding.pry
    if user.admin?
      can :manage, :all
      can %i[read create update destroy], Avo, user: user
      can :access, :all
    elsif user.buyer?
      can :read, :all
    elsif user.seller?
      can :read, :all
    end
  end

  # Define abilities for the user here. For example:
  #
  #   return unless user.admin?
  #   can :read, :all
  #   return unless user.admin?
  #   can :manage, :all
  # end
  #
  # The first argument to `can` is the action you are giving the user
  # permission to do.
  # If you pass :manage it will apply to every action. Other common actions
  # here are :read, :create, :update and :destroy.
  #
  # The second argument is the resource the user can perform the action on.
  # If you pass :all it will apply to every resource. Otherwise pass a Ruby
  # class of the resource.
  #
  # The third argument is an optional hash of conditions to further filter the
  # objects.
  # For example, here the user can only update published articles.
  #
  #   can :update, User, published: true
  #
  # See the wiki for details:
  # https://github.com/CanCanCommunity/cancancan/blob/develop/docs/define_check_abilities.md
end
# end
