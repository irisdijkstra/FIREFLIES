class FirefliesController < ApplicationController
  before_action :find_fly, only: %i[show destroy]
  skip_before_action :authenticate_user!, only: [:show], raise: false

  def index
    @fireflies = Firefly.where(email)
  end

  def show
  end

  def new
    # in final version this should be in costum route:
    @message = Message.find(params[:message_id])
    @firefly = Firefly.new
  end

  def index
    @fireflies = Firefly.where(firefly.message.email_to == current_user.email)
  end

  def create
    @message = Message.find(params[:message_id])

    @message.email_to.each do |receiver|
      @firefly = Firefly.new(email_recipient: receiver)
      @firefly.message = @message
      @firefly.update(firefly_params)

      if @firefly.save!
        puts "firefly to #{receiver} saved!"
      else
        puts "firefly to #{receiver} is not working"
      end
    end
  end

  def destroy
    @firefly.destroy!
    redirect_to root_path
  end

  private

  def find_fly
    @firefly = Firefly.find(params[:id])
  end

  def firefly_params
    params.require(:firefly).permit(:date_sent, :date_recieve)
  end
end
