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

  def edit
    @user = User.find(params[:id])   
  end

  def update  
    @user = User.find(params[:id]) 
    if @user.update_attributes(params[:user])  
      redirect_to @user, notice: "Benutzerprofil erfolgreich angepasst." 
    else
      render "edit", alert: "Es gab ein Problem mit der Anpassung. Bitte versuchen Sie es erneut." 
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to root_path, alert: "Profil erfolgreich gelöscht." 
  end
 
end