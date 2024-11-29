class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :owned_chats, class_name: "Chat", foreign_key: "book_owner_id"
  has_many :participated_chats, class_name: "Chat", foreign_key: "buyer_id"

  has_many :messages

  def initials
    "#{first_name[0]&.capitalize}#{last_name[0]&.capitalize}"
  end

  def full_name
    "#{first_name&.capitalize} #{last_name&.capitalize}"
  end
end
