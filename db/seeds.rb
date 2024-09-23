# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Create the books
# require 'faker'

# db/seeds.rb

# Creating Users
users = User.create!(
  [
    {
      first_name: 'Alice',
      last_name: 'Johnson',
      phone_number: '+971501234567',
      address: '123 Palm Jumeirah, Dubai, UAE',
      email: 'alice@example.com',
      password: 'password', # Added password here
    },
    {
      first_name: 'Bob',
      last_name: 'Smith',
      phone_number: '+971502345678',
      address: '456 Downtown Dubai, UAE',
      email: 'bob@example.com',
      password: 'password', # Added password here
    },
    {
      first_name: 'Carol',
      last_name: 'Davis',
      phone_number: '+971503456789',
      address: '789 Dubai Marina, UAE',
      email: 'carol@example.com',
      password: 'password', # Added password here
    }
  ]
)

# # Creating Categories
categories = Category.create!(
  [
    { name: 'Fiction' },
    { name: 'Non-Fiction' },
    { name: 'Science Fiction' },
    { name: 'Fantasy' },
    { name: 'Mystery' },
    { name: 'Thriller' },
    { name: 'Horror' },
    { name: 'Romance' },
    { name: 'Historical' },
    { name: 'Biography' },
    { name: 'Self-Help' },
    { name: 'Health & Wellness' },
    { name: 'Travel' },
    { name: 'Cooking' },
    { name: 'Art & Photography' },
    { name: 'Science' },
    { name: 'Philosophy' },
    { name: 'Religion & Spirituality' },
    { name: 'Poetry' },
    { name: 'Drama' },
    { name: 'Comics & Graphic Novels' },
    { name: 'Children’s Books' },
    { name: 'Young Adult' },
    { name: 'Education' },
    { name: 'Technology' },
    { name: 'Business' },
    { name: 'Politics' },
    { name: 'Sports' },
    { name: 'True Crime' },
    { name: 'Humor' }
  ]
)

# Create languages
languages = [
  "Mandarin Chinese",
  "Spanish",
  "English",
  "Hindi",
  "Arabic",
  "Bengali",
  "Portuguese",
  "Russian",
  "Japanese",
  "Punjabi",
  "German",
  "Javanese",
  "Wu (Shanghainese)",
  "Turkish",
  "Korean",
  "French",
  "Vietnamese",
  "Telugu",
  "Tamil",
  "Urdu",
  "Italian",
  "Thai",
  "Gujarati",
  "Persian (Farsi)",
  "Polish",
  "Dutch",
  "Romanian",
  "Hungarian",
  "Swedish",
  "Ukrainian"
]

languages.each do |language|
  Language.create(name: language)
end

# # Create users (if not already created)
# user_ids = User.pluck(:id) # Retrieve all user IDs.

# # Create the books
# statuses = ['available', 'sold', 'reserved']
# Book.all.destroy_all

# 50.times do
#   min_age = rand(5..10) # Random starting age
#   max_age = min_age + rand(1..5) # Random end age ensuring it is higher than min_age

#   Book.create!(
#     title: Faker::Book.title,
#     author: Faker::Book.author,
#     description: Faker::Lorem.sentence(word_count: 100), # Generates a short description
#     category_id: Category.pluck(:id).sample, # Randomly assigns one of the category IDs
#     language_id: Language.pluck(:id).sample, # Randomly assigns one of the language IDs
#     user_id: user_ids.sample, # Randomly assigns one of the user IDs
#     price: Faker::Commerce.price(range: 5.0..50.0), # Generates a price between $5.0 and $50.0
#     status: statuses.sample # Randomly assigns one of the statuses
#   )
# end

# puts "50 books have been created!"
