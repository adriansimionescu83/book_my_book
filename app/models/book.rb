# app/models/book.rb
class Book < ApplicationRecord
  include PgSearch::Model

  has_and_belongs_to_many :age_groups # Many-to-many association
  has_one_attached :photo
  has_many :chats

  belongs_to :user
  belongs_to :language
  belongs_to :category
  belongs_to :age_group


  # PgSearch
  pg_search_scope :global_search,
    against: [:title, :description, :author],
    associated_against: {
      language: [:id],
      category: [:id],
      age_group: [:id] # Add age_groups to the search
    },
    using: {
      tsearch: { prefix: true }
    }
end
