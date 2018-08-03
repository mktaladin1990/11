class ProductPolicy < ApplicationPolicy
  attr_reader :user, :record
  def initialize(user, record)
    @user = user
    @record = record
  end
  # def check?
  #   user.login?
  # end
  def destroy?
     user.present? && user.admin?

  end
  def edit?
    user.present? && user.admin?
  end
  def update?
    user.present? && user.admin?
  end
end
