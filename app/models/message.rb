class Message < ApplicationRecord
  has_one_attached :image
  has_one_attached :video
  has_many :fireflies
  belongs_to :user
  has_many :comments
end
