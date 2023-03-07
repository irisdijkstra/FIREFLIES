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
    @firefly = Firefly.new
    @message = Message.find(params[:message_id])
  end

  def create
    @message = Message.find(params[:message_id])
    @firefly = Firefly.new(firefly_params)
    @firefly.message = @message
    @message.user = current_user # sender
    @message.save!

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
    params.require(:firefly).permit(:date_send, :date_received, :recipient_emails)
  end

end
