require "faker"


puts 'Creating 10 seeds...'
first_name = ["paola", "ana", "iris", "evgenia", "danko"]
index = 0;
5.times do
  date = Faker::Date.between(from: '2021-03-07', to: '2025-03-07')
  user = User.new(
    first_name: first_name[index],
    last_name: Faker::Name.last_name,
    email: "#{first_name[index]}@firefly.com",
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
  index = index + 1
end
puts ""
puts 'Done!'
