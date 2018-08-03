class Admin::ProductPolicy < ApplicationPolicy
  attr_reader :user, :record
  def initialize(user, record)
    @user = user
    @record = record
  end
  # def check?
  #   user.login?
  # end
  def index?
    user.present? && user.admin?
  end
  
end
