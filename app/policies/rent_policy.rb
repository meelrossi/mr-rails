class RentPolicy < ApplicationPolicy
  attr_reader :user, :rent

  def initialize(user, rent)
    @user = user
    @rent = rent
  end

  def show?
    rent.user == user
  end
end
