# frozen_string_literal: true

class UserDropdownComponent < ViewComponent::Base
  delegate :current_user, :user_signed_in?, to: :helpers

  def before_render
    @user = current_user
  end
  
  def initialize()
  end

end
