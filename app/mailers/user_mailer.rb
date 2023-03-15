class UserMailer < ApplicationMailer
  def welcome
      @email = params[:email]
      mail(to: @email, subject: '✨ Welcome to Fireflies ✨')
  end
end
