# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/welcome
  def welcome
    # receiver = "beribakdanko@gmail.com"
    email = params[:email]
    # UserMailer.with(email: email).welcome.deliver_now
    UserMailer.with(email: email).welcome.deliver_later
  end

end
