class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :messages
  # has_many :fireflies, through: :messages
  ## not necessary for now, maybe later (as you could access the fireflies
  ## you've send only this way) 
end
