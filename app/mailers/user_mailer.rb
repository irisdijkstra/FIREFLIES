class UserMailer < ApplicationMailer
  def welcome
    mail(to: "beribakdanko@gmail.com", subject: "✨ Welcome to Fireflies ✨")
  end
end
