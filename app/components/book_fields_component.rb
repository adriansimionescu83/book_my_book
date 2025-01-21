# frozen_string_literal: true

class BookFieldsComponent < ViewComponent::Base
  def initialize(book:, form:)
    @book = book
    @form = form
  end
end
