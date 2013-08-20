class UsersController < ApplicationController
  
  skip_before_filter :require_login, :only => [:show, :create]

  def show
    @user = User.find(params[:id]) 
    @posts = @user.posts.reverse
  end

  def create
  	@user = User.new(params[:user])
  	if @user.save
  		auto_login(@user)
  		redirect_to @user, notice: "Benutzerprofil erfolgreich erstellt. Vielen Dank für Ihr Vertrauen."
  	else
  		redirect_to root_path, alert: "Es gab ein Problem mit ihrer Registrierung. Füllen Sie alle Felder aus und benützen Sie eine Email-Adresse, für die noch kein Benutzerkonto besteht." 
    end
  end




  # To be amended for NewLawyerly!!

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