class FirefliesController < ApplicationController

  def new
    # in final version this should be in costum route:
    @firefly = Firefly.new
  end

  def create
    @message = Message.find(params[:message_id])
    @firefly = Firefly.new(firefly_params)
    @firefly.message = @message
    # @message.user = current_user

    raise

    # if @firefly.save!
    #   redirect_to root_path
    # else
    #   render ""
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
    @firefly = Firefly.find(params[:id])
  end

  def destroy
    @firefly = Firefly.find(params[:id])
    @firefly.destroy!
  end

  private

  def firefly_params
    params.require(firefly).permit(:date_send, :date_received, :recipient_emails)
  end

end
