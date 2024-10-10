class Book < ApplicationRecord
  has_one_attached :photo
  has_many :chats

  belongs_to :user
  belongs_to :language
  belongs_to :category  
end
