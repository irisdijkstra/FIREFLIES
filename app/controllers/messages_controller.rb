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

  def upload
    if params[:file].content_type.start_with?("image")
      result = Cloudinary::Uploader.upload(params[:file])
      file_url = result["secure_url"]
    elsif params[:file].content_type.start_with?("video")
      result = Cloudinary::Uploader.upload_large(params[:file], resource_type: :video)
      file_url = result["secure_url"]
    else
      render json: {error: "Unsupported file type"}, status: 400
    end

    respond_to do |format|
      format.html
      format.json { render json: {file_url: file_url} }
    end
  rescue => error
    Rails.logger.error("Error uploading image to Cloudinary: #{error.message}")
    render json: {error: "Unable to upload image"}, status: 500
  end

  private

  def find_message
    @message = Message.find(params[:id])
  end

  def message_params
    params.require(:message).permit(:image, :letter, :video, :audio, email_to: [])
  end
end


