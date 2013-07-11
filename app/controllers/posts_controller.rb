class PostsController < ApplicationController

  # The 'new action' is 'included' under views/users/show

  def show
    @post = Post.find(params[:id])
  end

	def create
    @user = User.find(params[:user_id]) 
  	@post = @user.posts.build(params[:post])
  	if @post.save
  		redirect_to :back, notice: "Post successfully published."
  	else
  		render 'users/show', alert: "An unexpected problem occurred. Please try again."
  	end
  end

  def destroy  
    #if current_user == User.find(params[:id]) # TBD if this is sufficient protection!
      @post = Post.find(params[:id])
      @post.destroy
      redirect_to current_user, alert: "Post successfully deleted."
    #end
  end

end
