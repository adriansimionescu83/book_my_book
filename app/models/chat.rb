class Chat < ApplicationRecord
  has_many :messages, dependent: :destroy

  belongs_to :book_owner, class_name: "User", foreign_key: "book_owner_id"
  belongs_to :buyer, class_name: "User", foreign_key: "buyer_id"

  validates :book_owner_id, presence: true
  validates :buyer_id, presence: true
end