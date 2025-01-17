# frozen_string_literal: true

class BookFormComponent < ViewComponent::Base
  def initialize(book:)
    @book = book
  end
end
