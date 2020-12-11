class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @comment = Comment.new(comment_params)
    if @comment.valid?
      @comment.save
      ActionCable.server.broadcast 'comment_channel', content: @comment, nickname: @comment.user.nickname, tem_id: params[:item_id]
    # redirect_to item_path(@comment.item) 
    else
      @item = @comment.item
      @comments = @item.comments.includes(:user).order(id: "DESC")
      render "items/show"
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:comment).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
