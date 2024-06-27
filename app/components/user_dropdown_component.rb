# frozen_string_literal: true

class UserDropdownComponent < ViewComponent::Base
  delegate :current_user, :user_signed_in?, to: :helpers
  
  def initialize()
  end

end
