class MessagesController < ApplicationController
  before_action :find_message, only: %i[update edit]

  def create
    # raise
    @message = Message.new(message_params)
    @message.user_id = current_user.id
    @message.email_to = params[:emails]

    if @message.save
      redirect_to new_message_firefly_path(@message)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def new
    @message = Message.new
  end

  def edit
  end

  def update
    @message.update(message_params)
    redirect_to message_path(@message)
  end

  private

  def find_message
    @message = Message.find(params[:id])
  end

  def message_params
    params.require(:message).permit(:image, :letter, :video, :audio, email_to: [])
  end
end
