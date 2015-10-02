class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
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
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
    user ||= User.new
    
    alias_action :create, :update, :to=>:modify
    

    can :read, Book    # show and index
    can :sell, Book
    can :create_sell, Book
    can :book_save, Book
    can :modify, Book if user.is?(:admin)
    can :destroy, Book if user.is?(:admin)
   

    can :read, Exchange if user.is?(:admin)

    can :read, Report if user.is?(:admin)
    can :create, Report

    can :read, User
    can :modify, User if user.is?(:admin)
    can :ban, User if user.is?(:admin)
    can :unban, User if user.is?(:admin)
    can :destroy, User if user.is?(:admin)

    can :read, :all if user.is?(:superuser)
    can :modify, :all if user.is?(:superuser)
    can :destroy, :all if user.is?(:superuser)
    can :ban, User if user.is?(:superuser)
    can :unban, User if user.is?(:superuser)


  end
end
