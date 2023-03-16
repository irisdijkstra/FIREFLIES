class FirefliesController < ApplicationController
  before_action :find_fly, only: %i[show destroy update]
  skip_before_action :authenticate_user!, only: [:show], raise: false

  def show
    @comment = Comment.new
    @comments = @firefly.message.comments
    @message = @firefly.message
  end

  def date
    @message = Message.find(params[:message_id])
  end

  def update
    @firefly = Firefly.find(params[:id])
    @firefly.update(firefly_params)
    # UserMailer.with(email: @firefly.email_recipient).welcome.deliver_now
    respond_to do |format|
      format.html { redirect_to root_path } # if HTML requested, redirect to index
      format.text { render partial: "fireflies/form", locals: { firefly: @firefly }, formats: [:html] }
    end
    raise
  end

  def destroy
    @firefly.destroy!
    flash[:notice] = "Firefly has been destroyed."
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
