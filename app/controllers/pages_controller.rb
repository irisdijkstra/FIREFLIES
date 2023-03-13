class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    UserMailer.welcome.deliver_now
    redirect_to timeline_path if current_user
  end

  def timeline
    @fireflies = Firefly.where(email_recipient: current_user.email).order("date_recieve ASC")
    @first_to_come = @fireflies.find_by("date_recieve > ?", Date.today)
  end

  # don't remove it, need it later
  # def content
  #   @message = Message.new
  # end

  # def destination
  #   @firefly = Firefly.new
  # end
end
