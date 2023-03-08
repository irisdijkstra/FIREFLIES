class FirefliesController < ApplicationController
  before_action :find_fly, only: %i[show destroy update]
  skip_before_action :authenticate_user!, only: [:show], raise: false

  def index
    @fireflies = Firefly.where(email_recipient: current_user.email.class)
  end

  def show
  end

  def date
    @message = Message.find(params[:message_id])
  end

  def update
    ## LEAVE LOOP HERE! We might need it later :) ##
    # @message.fireflies.each do |firefly|
      @firefly.update(firefly_params)
    # end

    redirect_to root_path
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
