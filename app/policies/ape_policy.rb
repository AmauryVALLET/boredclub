class ApePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
       scope.all
    end
  end

  def show?
    true
  end
  
  def new?
    create?
  end

  def create?
    true
  end

  def destroy?
    true
  end

  def update?
    true
  end

  

end
