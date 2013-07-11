class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(params[:comment])
    @comment.user = current_user
    @comment.save

    unless @post.user_id == current_user.id
    	Notification.create(:user_id => @post.user_id, :commenter_id => @comment.user_id, :post_id => @post.id)
  	end

    redirect_to :back, :notice => "Your comment was successfully submitted."
  end

end
