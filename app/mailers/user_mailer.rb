class UserMailer < ApplicationMailer
  def welcome
    @firefly = params[:firefly]
    @email = params[:email]
      mail(to: @email, subject: '✨ Welcome to Fireflies ✨')
  end
end
