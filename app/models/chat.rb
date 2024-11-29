class Chat < ApplicationRecord
  has_many :messages, dependent: :destroy

  belongs_to :book_owner, class_name: "User", foreign_key: "book_owner_id"
  belongs_to :buyer, class_name: "User", foreign_key: "buyer_id"
  belongs_to :book, class_name: "Book", foreign_key: "book_id"

  validates :book_owner_id, presence: true
  validates :buyer_id, presence: true
  validates :buyer_id, presence: true
  before_create :format_chat_name

  def format_chat_name
    self.name = "Chat between #{book_owner.first_name} and #{buyer.first_name} for book #{book.title}"
  end

end