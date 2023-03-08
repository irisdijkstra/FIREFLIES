class Firefly < ApplicationRecord
  belongs_to :message
  # validates :date_sent, presence: true
end
