class GamingSessionPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
    def resolve
      scope.all # If users can see all gaming_session
      # scope.where(user: user) # If users can only see their gaming_session
      # scope.where("name LIKE 't%'") # If users can only see gaming_session starting with `t`
      # ...
    end
  end

  def show?
    true
  end

  def create?
    true
  end

  def update?
    record.user == user
    # record: the gamingsession passed to the `authorize` method in controller
    # user: the `current_user` signed in with Devise
  end

  def destroy?
    record.user == user
  end
end
