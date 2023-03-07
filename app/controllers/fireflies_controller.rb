class FirefliesController < ApplicationController
  before_action :find_fly, only: %i[show destroy]
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
    @firefly = Firefly.new(firefly_params)
    @firefly.message = @message
    @firefly.email_recipient = @message.email_to.first
    # @message.user = current_user   # sender

    # if @firefly.save!
    #   redirect_to root_path
    # else
    #   render "messages/form", status: :unprocessed_entity
    # end

    # @chatroom = Chatroom.find(params[:chatroom_id])
    # @message = Message.new(message_params)
    # @message.chatroom = @chatroom
    # @message.user = current_user
    # if @message.save
    #   redirect_to chatroom_path(@chatroom)
    # else
    #   render "chatrooms/show", status: :unprocessed_entity
    # end

  end

  def show
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
    params.require(:firefly).permit(:date_send, :date_received, :recipient_emails)
  end

end
