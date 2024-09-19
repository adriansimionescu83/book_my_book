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
user_ids = User.all.ids # Adjust this range based on your actual user IDs.

50.times do
  Book.create!(
    title: Faker::Book.title,
    author: Faker::Book.author,
    user_id: user_ids.sample, # Randomly assigns one of the user IDs
    price: Faker::Commerce.price(range: 5.0..50.0), # Generates a price between $5.0 and $50.0
    status: statuses.sample # Randomly assigns one of the statuses
  )
end

puts "50 books have been created!"