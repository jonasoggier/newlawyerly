class PostsController < ApplicationController

  skip_before_filter :require_login, :only => :show

  def show
    @post = Post.find(params[:id])
    @nextpost = @post.previous
  end

  def new
    @post = Post.new
  end
 
	def create
    if current_user.company_account
  	 @post = current_user.posts.build(params[:post])
    end
    
  	if @post.save
  		redirect_to [current_user, @post], notice: "Gratulation! Beitrag erfolgreich erstellt."
  	else
      render :new  
    end
  end

  def edit
    @post = current_user.posts.find(params[:id])
  end

  def update  
      if current_user.company_account
        @post = current_user.posts.find(params[:id])
      end

      if @post.update_attributes(params[:post])  
        redirect_to [current_user, @post], notice: "Beitrag erfolgreich angepasst." 
      else
        render :edit
      end
  end

  def destroy  
    @post = current_user.posts.find(params[:id])
    @post.destroy
    redirect_to current_user, alert: "Beitrag erfolgreich gelöscht."
  end

end
