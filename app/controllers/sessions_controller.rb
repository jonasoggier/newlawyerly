class SessionsController < ApplicationController

  skip_before_filter :require_login, :only => [:create]

  def create
	@user = login(params[:email], params[:password])
	if @user
		redirect_to root_path, notice: "Schön, dass Sie vorbeischauen, #{@user.first_name}!"
	else
		redirect_to :root, :alert => "Ungültiger Benutzername oder Passwort. Versuchen Sie es bitte nochmals!"
	end
  end

  def destroy
	logout
	redirect_to :root, notice: "Auf Wiedersehen... Hoffentlich kommen Sie bald wieder!"
  end

end