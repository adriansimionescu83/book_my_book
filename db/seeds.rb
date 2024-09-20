# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Create the books
require 'faker'

statuses = ['available', 'sold', 'reserved']
user_ids = User.pluck(:id) # Retrieve all user IDs.

50.times do
  min_age = rand(5..10) # Random starting age
  max_age = min_age + rand(1..5) # Random end age ensuring it is higher than min_age

  Book.create!(
    title: Faker::Book.title,
    author: Faker::Book.author,
    description: Faker::Lorem.sentence(word_count: 20), # Generates a short description
    age_recommendation: (min_age..max_age), # Sets the age range as an int4range
    user_id: user_ids.sample, # Randomly assigns one of the user IDs
    price: Faker::Commerce.price(range: 5.0..50.0), # Generates a price between $5.0 and $50.0
    status: statuses.sample # Randomly assigns one of the statuses
  )
end

puts "50 books have been created!"
