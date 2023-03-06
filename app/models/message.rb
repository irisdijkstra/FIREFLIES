class Message < ApplicationRecord
  has_many :fireflies
  belongs_to :user
end
