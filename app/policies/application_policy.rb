class ApplicationPolicy
  attr_reader :user, :reader

  def create?
    user.present?
  end

  def update?
    user.present? && (record.user == user)
  end

  def destroy?
    user.present? && (record.user == user)
  end
end
