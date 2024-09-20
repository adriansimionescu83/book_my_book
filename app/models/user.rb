class User < ApplicationRecord
  has_one :address
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def initials
    "#{first_name[0]&.capitalize}#{last_name[0]&.capitalize}"
  end

  def full_name
    "#{first_name&.capitalize} #{last_name&.capitalize}"
  end
end
