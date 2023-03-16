class CommentsController < ApplicationController
  before_action :find_message

  def show
  end

  def new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.message = @message
    @comment.user = current_user
    if @comment.save!
      redirect_to firefly_path(params[:firefly_id])
    else
      render :new, status: :unprocessable_entity
    end
  end


  private

  def comment_params
    params.require(:comment).permit(:content)
  end

  def find_message
    @message = Message.find(params[:message_id])
  end

end
