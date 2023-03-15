class CommentsController < ApplicationController
  before_action :set_comment
  before_action :find_fly

  def index
    @comments = Comment.all
  end

  def show
  end

  def new
  end

  def create
    @comment = Comment.new(comment_params)
    @firefly.comment = @comment
    if @comment.save!
      # redirect_to firefly_path(@comment)
    else
      render :new, status: :unprocessable_entity
    end
  end


  private

  def comment_params
    params.require(:comment).permit(:content, :message_id)
  end

  def find_fly
    @firefly = Firefly.find(params[:firefly_id])
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  # def find_message
  #   @message = Message.find(params[:message_id])
  # end
end
