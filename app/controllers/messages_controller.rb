class MessagesController < ApplicationController
  before_action :find_message, only: %i[update edit]

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    @message.user_id = current_user.id
    @message.email_to = params[:emails]

    if @message.save!
      @message.email_to.each do |receiver|
        @firefly = Firefly.new(email_recipient: receiver, date_sent: Date.today)
        @firefly.message = @message
        @firefly.save!
      end
      redirect_to message_date_path(@message)
    else
      render :new, status: :unprocessable_entity
    end
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
