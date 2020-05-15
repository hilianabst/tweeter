# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

Tweet.destroy_all

puts 'started loading person data'

users_number = User.all.size

100.times do |row|
    Tweet.create content: Faker::Lorem.paragraph, 
                 user_id: (1..users_number).to_a.sample,
                 photo: "https://picsum.photos/id/#{row}/1/1"
end
<<<<<<< HEAD

puts 'finished loading person data'

# AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
=======
puts 'finished loading person data'AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
>>>>>>> 2e48a251abd03b2f95cecba81ac4814999e76049
