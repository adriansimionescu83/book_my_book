class ChatPolicy < ApplicationPolicy
  # NOTE: Up to Pundit v2.3.1, the inheritance was declared as
  # `Scope < Scope` rather than `Scope < ApplicationPolicy::Scope`.
  # In most cases the behavior will be identical, but if updating existing
  # code, beware of possible changes to the ancestors:
  # https://gist.github.com/Burgestrand/4b4bc22f31c8a95c425fc0e30d7ef1f5

  class Scope < ApplicationPolicy::Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      Rails.logger.debug("Current User ID: #{user.id}") # Check the current user

      scope.where("book_owner_id = ? OR buyer_id = ?", user.id, user.id)
    end
    
  end

  def show?
    # Only the book owner or buyer can view the chat
    user == record.book_owner || user == record.buyer
  end

end
