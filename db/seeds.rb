require 'faker'
require "open-uri"

# Destroy all seeds first before craeting new ones
Firefly.destroy_all
Message.destroy_all
User.destroy_all

puts 'Creating 10 seeds...'
first_name = ["paola", "ana", "iris", "evgeniya", "danko"]
file = "https://wl-brightside.cf.tsp.li/resize/728x/jpg/55e/4fe/090f595ddfa20a96d1c00f6936.jpg"
index = 1

5.times do
  date = Faker::Date.between(from: '2023-03-04', to: '2023-03-08')

  user = User.new(
    first_name: first_name[index],
    last_name: Faker::Name.last_name,
    email: "#{first_name[index]}@firefly.com",
    password: 111111
  )
  user.save!
  message = Message.new(
    letter: Faker::Movie.quote,
    # video: nil,
    # audio: nil
    user_id: user.id,
    email_to: ["#{first_name[index - 1]}@firefly.com"]
    )
    message.image.attach(io: URI.open(file), filename: "bench.png", content_type: "image/png")

  message.save!
  firefly = Firefly.new(
    date_sent: date,
    date_recieve: (date + 1),
    email_recipient: "#{first_name[index - 1]}@firefly.com",
    message_id: message.id
  )
  firefly.save!
  index += 1
end
puts ""
puts 'Done!'
