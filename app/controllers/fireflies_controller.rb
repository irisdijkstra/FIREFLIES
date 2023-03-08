class FirefliesController < ApplicationController
  before_action :find_fly, only: %i[show destroy]
  skip_before_action :authenticate_user!, only: [:show], raise: false

  def index
    @fireflies = Firefly.where(email_to == current_user.email)
  end

  def show
  end

  def new
    # in final version this should be in costum route:
    @firefly = Firefly.new
    @message = Message.find(params[:message_id])
  end

  def index
    @fireflies = Firefly.where(firefly.message.email_to == current_user.email)
  end

  def create
    @message = Message.find(params[:message_id])

    @message.email_to.each do |receiver|
      @firefly = Firefly.new(firefly_params)
      @firefly.email_recipient = receiver
      @firefly.message = @message
      @firefly.save!
    end
    # @firefly.email_recipient = @message.email_to.first
      @message.user = current_user # sender
      # @message.save!

    if @firefly.save!
      redirect_to root_path
    else
      render "fireflies/form", status: :unprocessed_entity
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
    params.require(:firefly).permit(:date_sent, :date_recieve, :email_recipient)
  end
end
