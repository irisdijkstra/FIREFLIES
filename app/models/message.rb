class Message < ApplicationRecord
  has_one_attached :image
  has_many :fireflies
  belongs_to :user
end
