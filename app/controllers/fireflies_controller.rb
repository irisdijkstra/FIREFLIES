class FirefliesController < ApplicationController

  def create
    @message = Message.where(message_id: params[:message_id])

    # in costum route:
    @firefly = Firefly.new

    # here
    @firefly = Firefly.create!(firefly_params)
  end

  def show
    @firefly = Firefly.find(params[:id])
  end

  private

  def firefly_params
    params.require(firefly).permit(:date_send, :date_received, :recipient_emails)
  end

end
