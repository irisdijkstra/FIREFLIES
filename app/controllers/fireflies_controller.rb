class FirefliesController < ApplicationController
  before_action :find_fly, only: %i[show destroy update]
  skip_before_action :authenticate_user!, only: [:show], raise: false

  def show
  end

  def date
    @message = Message.find(params[:message_id])
  end

  def update
    @firefly = Firefly.find(params[:id])
    @firefly.update(firefly_params)

    respond_to do |format|
      format.html { redirect_to root_path } # if HTML requested, redirect to index
      format.text { render partial: "fireflies/form", locals: { firefly: @firefly }, formats: [:html] }
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
