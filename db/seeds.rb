# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#

# Create the books
require 'faker'
require 'open-uri'


# Creating Users
# users = User.create!(
#   [
#     {
#       first_name: 'Alice',
#       last_name: 'Johnson',
#       phone_number: '+971501234567',
#       address: '123 Palm Jumeirah, Dubai, UAE',
#       email: 'alice@example.com',
#       password: 'password', # Added password here
#     },
#     {
#       first_name: 'Bob',
#       last_name: 'Smith',
#       phone_number: '+971502345678',
#       address: '456 Downtown Dubai, UAE',
#       email: 'bob@example.com',
#       password: 'password', # Added password here
#     },
#     {
#       first_name: 'Carol',
#       last_name: 'Davis',
#       phone_number: '+971503456789',
#       address: '789 Dubai Marina, UAE',
#       email: 'carol@example.com',
#       password: 'password', # Added password here
#     }
#   ]
# )

# # Creating Categories
# categories = Category.create!(
#   [
#     { name: 'Fiction' },
#     { name: 'Non-Fiction' },
#     { name: 'Science Fiction' },
#     { name: 'Fantasy' },
#     { name: 'Mystery' },
#     { name: 'Thriller' },
#     { name: 'Horror' },
#     { name: 'Romance' },
#     { name: 'Historical' },
#     { name: 'Biography' },
#     { name: 'Self-Help' },
#     { name: 'Health & Wellness' },
#     { name: 'Travel' },
#     { name: 'Cooking' },
#     { name: 'Art & Photography' },
#     { name: 'Science' },
#     { name: 'Philosophy' },
#     { name: 'Religion & Spirituality' },
#     { name: 'Poetry' },
#     { name: 'Drama' },
#     { name: 'Comics & Graphic Novels' },
#     { name: 'Children’s Books' },
#     { name: 'Young Adult' },
#     { name: 'Education' },
#     { name: 'Technology' },
#     { name: 'Business' },
#     { name: 'Politics' },
#     { name: 'Sports' },
#     { name: 'True Crime' },
#     { name: 'Humor' }
#   ]
# )

# # # Create languages
# languages = [
#   "Mandarin Chinese",
#   "Spanish",
#   "English",
#   "Hindi",
#   "Arabic",
#   "Bengali",
#   "Portuguese",
#   "Russian",
#   "Japanese",
#   "Punjabi",
#   "German",
#   "Javanese",
#   "Wu (Shanghainese)",
#   "Turkish",
#   "Korean",
#   "French",
#   "Vietnamese",
#   "Telugu",
#   "Tamil",
#   "Urdu",
#   "Italian",
#   "Thai",
#   "Gujarati",
#   "Persian (Farsi)",
#   "Polish",
#   "Dutch",
#   "Romanian",
#   "Hungarian",
#   "Swedish",
#   "Ukrainian"
# ]

# languages.each do |language|
#   Language.create(name: language)
# end

# Destroy all books, chats and age groups if already created
# Chat.destroy_all
# Book.destroy_all
# AgeGroup.destroy_all

# Age groups
AgeGroup.create([{ name: "0-2 Years (Babies and Toddlers)" }, { name: "3-5 Years (Preschoolers)" }, { name: "6-8 Years (Early Readers)" }, { name: "9-12 Years (Middle Grade)" } , { name: "13-18 Years (Young Adult)" }])

# Create users (if not already created)
user_ids = User.pluck(:id) # Retrieve all user IDs.

# Create the books
statuses = ['available', 'sold', 'reserved']

# Destroy all books if books are already created
Chat.destroy_all
Book.destroy_all

50.times do

  image_url = "https://picsum.photos/400/600"
  file = URI.parse(image_url).open

  # begin
  #   file = URI.parse(Faker::LoremFlickr.unique.image(size: "400x600", search_terms: ['book'])).open
  # rescue OpenURI::HTTPError, Net::OpenTimeout => e
  #   retry_count += 1
  #   retry if retry_count < 3
  #   puts "Failed to download image after 3 attempts: #{e.message}"
  # end

  book = Book.create!(
    title: Faker::Book.title,
    author: Faker::Book.author,
    description: Faker::Lorem.sentence(word_count: 100), # Generates a short description
    category_id: Category.pluck(:id).sample, # Randomly assigns one of the category IDs
    language_id: Language.pluck(:id).sample, # Randomly assigns one of the language IDs
    age_group_id: AgeGroup.pluck(:id).sample,
    user_id: user_ids.sample, # Randomly assigns one of the user IDs
    price: Faker::Commerce.price(range: 5.0..50.0), # Generates a price between $5.0 and $50.0
    status: statuses.sample, # Randomly assigns one of the statuses
  )

  book.photo.attach(io: file, filename: "nes.png", content_type: "image/png")

end

puts "50 books have been created with images!"

