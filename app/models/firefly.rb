class Firefly < ApplicationRecord
  # Dont add date_receive validations here! (discussed with Danko)
  # Otherwise, the /date form would not work (we need to pass a firefly without date_receive)
  belongs_to :message
end
