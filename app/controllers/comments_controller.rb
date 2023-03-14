class CommentsController < ApplicationController
  before_action :set_fireflies, only: %i[new create]
  def new
    @comment = Comment.new
  end


  private

  def comment_params
    params.require(:comment).permit(:content)
  end

  def set_fireflies
    @firefly = Firefly.find(params[:firefly_id])
  end
end
