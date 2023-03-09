class Firefly < ApplicationRecord
  # Dont add date_receive validations here! (discussed with Danko)
  # Otherwise, the /date form would not work (we need to pass a firefly without date_receive)
  belongs_to :message
  # validates :date_sent, presence: true
  # should be checked because now not working, as fireflies creating on default with nil date_recieve
  # validates :date_receive, inclusion: { in: Proc.new{ 1.day.from_now.. }, message: "has to be in the future" }
end
