require 'faker'

# Destroy all seeds first before craeting new ones
Firefly.destroy_all
Message.destroy_all
User.destroy_all

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts 'Creating 10 seeds...'

10.times do
  first_name = Faker::Name.first_name
  date = Faker::Date.between(from: '2021-03-07', to: '2025-03-07')

  user = User.new(
    first_name: first_name,
    last_name: Faker::Name.last_name,
    email: "#{first_name}@firefly.com",
    password: 111111
  )
  user.save!

  message = Message.new(
    letter: Faker::Movie.quote,
    # image: nil,
    # video: nil,
    # audio: nil
    user_id: user.id
    )
  message.save!

  firefly = Firefly.new(
    date_sent: date,
    date_recieve: (date+365),
    email_recipient: Faker::Internet.email,
    message_id: message.id
  )
  firefly.save!
end

puts ""
puts 'Done!'
