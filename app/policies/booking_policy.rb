class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  def dashboard?
    true
  end

  def accept?
    record.gaming_session.user == user
  end

  def refuse?
    record.gaming_session.user == user
  end

  def create?
    true
  end
end
