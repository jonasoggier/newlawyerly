class UsersController < ApplicationController
  
  skip_before_filter :require_login, :only => [:create]

  # "new action" is on homepage (home#index) 
  
  def index # exclusively needed for user search in navbar
    @search_users = PgSearch.multisearch(params[:search])
    session[:search_users] = @search_users # needs to be saved in session b/c of redirect
    redirect_to :back
  end

  def show
    @user = User.find(params[:id]) 
    @post = Post.new # needed as input for new posts form
    @posts = @user.posts.page params[:page] # needed to display list of all posts
  end

  def create
  	@user = User.new(params[:user])
  	if @user.save
  		auto_login(@user)
  		redirect_to @user, notice: "Account successfully created."
  	else
  		redirect_to root_path, alert: "There was a problem with your sign-up. Please try again." # TODO!!!
    end
  end

  def edit
    if current_user == User.find(params[:id]) # TBD if this is sufficient protection!
      @user = User.find(params[:id])   
    end
  end

  def update  
    if current_user == User.find(params[:id]) # TBD if this is sufficient protection!
      @user = User.find(params[:id]) 
      if @user.update_attributes(params[:user])  
        redirect_to @user, notice: "Profile successfully updated." 
      else
        # do something else TODO
      end
    end
  end

  def destroy
    if current_user == User.find(params[:id]) # TBD if this is sufficient protection!
      @user = User.find(params[:id])
      @user.destroy
      redirect_to root_path, alert: "Profile successfully deleted." 
    end
  end
 
end