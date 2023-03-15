class UserMailer < ApplicationMailer
  def welcome
      @email = params[:email] # Instance variable => available in view
      mail(to: @email, subject: '✨ Welcome to Fireflies ✨')
      # This will render a view in `app/views/user_mailer`!

  end
end
