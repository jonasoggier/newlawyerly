class PostsController < ApplicationController

  skip_before_filter :require_login, :only => :show

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end
 
	def create
  	@post = current_user.posts.build(params[:post])
  	if @post.save
  		redirect_to [current_user, @post], notice: "Gratulation! Beitrag erfolgreich erstellt."
  	else
      render :new  
    end
  end



  # To be amended for NewLawyerly!!

  def destroy  
    #if current_user == User.find(params[:id]) # TBD if this is sufficient protection!
      @post = Post.find(params[:id])
      @post.destroy
      redirect_to current_user, alert: "Post successfully deleted."
    #end
  end

end
