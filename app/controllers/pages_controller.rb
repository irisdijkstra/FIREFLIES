class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
      @fireflies = Firefly.where(email_recipient: "iris")
  end

  # don't remove it, need it later
  # def content
  #   @message = Message.new
  # end

  # def destination
  #   @firefly = Firefly.new
  # end
end
