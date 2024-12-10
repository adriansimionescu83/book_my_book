class Book < ApplicationRecord
  include PgSearch::Model

  has_one_attached :photo
  has_many :chats

  belongs_to :user
  belongs_to :language
  belongs_to :category  

  pg_search_scope :global_search,
  against: [ :title, :description, :author ],
  associated_against: {
    language: [ :name ], 
    category: [ :name ]
  },
  using: {
    tsearch: { prefix: true }
  }
end
